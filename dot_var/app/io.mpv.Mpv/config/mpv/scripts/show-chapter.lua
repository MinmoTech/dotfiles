-- from https://r.nf/r/mpv/comments/j96hp0/display_chapter_title_when_the_chapter_changes/
local function showChapterTitle()
    local chapterTitle = mp.get_property_osd("chapter-metadata/by-key/title")
    mp.osd_message(chapterTitle, 10)
end

mp.observe_property("chapter", nil, showChapterTitle)
