#!/usr/bin/env python3

import pathlib
import re
import sys
from typing import Union

from sortedcontainers import SortedDict
from yt_dlp import YoutubeDL
from yt_dlp.postprocessor import FFmpegEmbedSubtitlePP, FFmpegMetadataPP
from yt_dlp.postprocessor.common import PostProcessor

url = sys.argv[1]


class ChaptersFromTimestampsPP(PostProcessor):
    def __init__(self, downloader=None, **kwargs):
        super().__init__(downloader)
        self.timestamp_regex = r"(?:^|\s*>?\s?\[?)((?:\d{1,2}:)?\d{1,2}:\d{2})\]?-?\s?(.*?)(?=(?:(?:\d{1,2}:)?\d{1,2}:\d{2})|$)"

        # if true will only include comments that include chapter_style_comment_threshold number of comments
        self.include_only_chapter_style_timestamps = True
        self.chapter_style_comment_threshold = 5

        # If a timestamp already exists within timestamp +/- merge_duplicate_comments_timeframe, the new one will be skipped
        self.merge_duplicate_comments_timeframe = 7

        options = kwargs.get("process", None)

        if options:
            if (
                "include_only_chapter_style_timestamps" in options
                and options["include_only_chapter_style_timestamps"] == "False"
            ):
                self.include_only_chapter_style_timestamps = False
            if "chapter_style_comment_threshold" in options:
                self.chapter_style_comment_threshold = int(
                    options["chapter_style_comment_threshold"]
                )
            if "merge_duplicate_comments_timeframe" in options:
                self.merge_duplicate_comments_timeframe = int(
                    options["merge_duplicate_comments_timeframe"]
                )
        else:
            print("No options 😥")

    def convert_timestamp_to_seconds(self, timestamp_list: list[str]) -> int:
        int_timestamp_list = list(map(int, timestamp_list))
        if len(timestamp_list) == 2:
            return int_timestamp_list[0] * 60 + int_timestamp_list[1]
        else:
            return (
                int_timestamp_list[0] * 60 * 60
                + int_timestamp_list[1] * 60
                + int_timestamp_list[2]
            )

    def add_original_video_capters(
        self,
        sorted_comments: SortedDict,
        original_chapters: list[dict[str, Union[str, int]]],
    ):
        if original_chapters:
            for chapter in original_chapters:
                sorted_comments[chapter["start_time"]] = chapter["title"]

    def add_to_sorted_comments_dict(
        self, sorted_comments: SortedDict, timestamp_in_sec: int, comment_text: str
    ):
        for i in range(
            timestamp_in_sec, timestamp_in_sec + self.merge_duplicate_comments_timeframe
        ):
            if i in sorted_comments or i * -1 in sorted_comments:
                return
        sorted_comments[timestamp_in_sec] = comment_text

    def get_ffmpeg_compatible_chapter_list(
        self, comments_dict: SortedDict, output_format: str
    ) -> list[dict[str, Union[int, str]]]:
        comments_list = []

        temp_comments_list = list(comments_dict)
        for index, timestamp in enumerate(temp_comments_list):
            if output_format == "mp4" and index == 0:
                initial_chapter_end_time = (
                    temp_comments_list[index]
                    if index + 1 < len(temp_comments_list)
                    else timestamp
                )
                comments_list.append(
                    {
                        "start_time": 0,
                        "title": "-",
                        "end_time": initial_chapter_end_time,
                    }
                )

            end_time = (
                temp_comments_list[index + 1]
                if index + 1 < len(temp_comments_list)
                else timestamp
            )
            comments_list.append(
                {
                    "start_time": timestamp,
                    "title": comments_dict[timestamp],
                    "end_time": end_time,
                }
            )
        return comments_list

    def run(self, info_dict):
        output_format = pathlib.Path(info_dict.get("_filename")).suffix
        print(output_format)
        sorted_comments = SortedDict()
        comments = info_dict["comments"]
        if "chapters" in info_dict and info_dict["chapters"]:
            original_chapters = info_dict["chapters"]
            self.add_original_video_capters(sorted_comments, original_chapters)

        if comments:
            for comment in comments:
                comment_text = comment["text"]
                if self.include_only_chapter_style_timestamps:
                    single_timestamp_regex = r"((?:\d{1,2}:)?\d{1,2}:\d{2})"
                    matches = re.finditer(single_timestamp_regex, comment_text)

                    timestamps_in_comment = len(list(matches))
                    if timestamps_in_comment < self.chapter_style_comment_threshold:
                        continue

                matches = re.finditer(self.timestamp_regex, comment_text, re.MULTILINE)
                for match in matches:
                    timestamp_list = match.group(1).split(":")
                    timestamp_in_sec = self.convert_timestamp_to_seconds(timestamp_list)
                    comment_text = match.group(2)
                    comment_text = comment_text.strip()
                    if comment_text:
                        self.add_to_sorted_comments_dict(
                            sorted_comments, timestamp_in_sec, comment_text
                        )

        comments_list = self.get_ffmpeg_compatible_chapter_list(
            sorted_comments, output_format
        )
        info_dict["chapters"] = comments_list
        return [], info_dict


if __name__ == "__main__":
    # more comments increase download time
    max_comments = 500
    # setting to 2 makes it inspect comment replies too, increases download time significantly
    # you should increase max_comments if setting this to "2",
    # as on some videos the first comment has many hundreds of replies
    max_replies_per_thread = 5
    # in mp4 files the first chapter will always start at 0:00, so if mp4 is chosen as output_format,
    # a dummy chapter will be added at the start titled "-"
    output_format = "mkv"

    url = sys.argv[1]

    ydl_opts = {
        "outtmpl": "~/Videos/youtube/%(title)s-%(id)s.%(ext)s",
        "writesubtitles": True,
        "writeautomaticsub": True,
        "getcomments": True,
        "merge_output_format": output_format,
        "getcomments": True,
        "subtitleslangs": ["jpn", "ja", "en", "de"],
        "extractor_args": {
            "youtube": {
                "max_comments": [str(max_comments), "all", "all", str(max_replies_per_thread)],
                "comment_sort": ["top"],
            }
        },
        # "format": "worstvideo+worstaudio",
    }

    with YoutubeDL(ydl_opts) as ydl:
        ydl.add_post_processor(ChaptersFromTimestampsPP())
        ydl.add_post_processor(FFmpegMetadataPP(downloader=None))
        ydl.add_post_processor(FFmpegEmbedSubtitlePP())
        ydl.download([url])
