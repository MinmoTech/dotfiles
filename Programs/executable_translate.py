#!/usr/bin/env python3
from concurrent.futures.thread import ThreadPoolExecutor
from io import BytesIO
import re

import pykakasi
import pyperclip
from deep_translator import DeepL
from gtts import gTTS
from notifypy import Notify
from pydub import AudioSegment
from pydub.playback import play

pyperclip.copy("")
text = pyperclip.paste(primary=True)
text = text.replace(" ", "").replace("\n", "")


def speak_audio(text):
    with BytesIO() as mp3_fp:
        tts = gTTS(text, lang="ja")
        tts.write_to_fp(mp3_fp)
        mp3_fp.seek(0)

        return AudioSegment.from_file(mp3_fp, format="mp3")


def translate(text):
    translated = DeepL(
        api_key="5116a7eb-1c74-35b7-d486-652239c62420:fx",
        source="ja",
        target="en",
        use_free_api=True,
    ).translate(text)
    return translated


def google_translate(text):
    return GoogleTranslator(source="ja", target="en").translate(text=text)


def convert_to_hiragana(text):
    kks = pykakasi.kakasi()
    result = kks.convert(text)
    result_str = ""
    for item in result:
        result_str += item["hira"]
    return result_str


def clean_text(text):
    text = text.strip()
    text = re.sub(r"\[.*?\]", "", text)
    text = re.sub(r"\{.*?\}", "", text)
    text = re.sub(r"（.*?）", "", text)
    text = text.replace("\n", "")
    text = text.replace(" ", "")
    return text


text = clean_text(text)
with ThreadPoolExecutor(max_workers=5) as executor:
    hiragana_thread = executor.submit(convert_to_hiragana, (text))
    translate_thread = executor.submit(translate, (text))
    google_translate_thread = executor.submit(google_translate, (text))
    audio_thread = executor.submit(speak_audio, (text))
hiragana = hiragana_thread.result(7)
translation = translate_thread.result(7)
pyperclip.copy(translation)
google_translation = google_translate_thread.result(7)

final_text = f"{hiragana}\n{translation}"

notification = Notify()
notification.title = text
notification.message = final_text
notification.icon = ""
notification.send(block=False)


audio = audio_thread.result()
play(audio)
