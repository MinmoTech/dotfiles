import sys

from deep_translator import DeepL

text = sys.argv[1]

translated = DeepL(
    api_key="5116a7eb-1c74-35b7-d486-652239c62420:fx",
    source="ja",
    target="en",
    use_free_api=True,
).translate(text)
print(translated)
