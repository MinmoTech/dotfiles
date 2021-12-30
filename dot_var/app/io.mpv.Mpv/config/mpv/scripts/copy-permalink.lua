function copyPermalink()
  local pos = mp.get_property_number("time-pos")
  local uri = mp.get_property("path")
  -- %q might not be fully robust
  local bookmark = string.format("mpv --start=%s %q", pos, uri)
  local pipe = io.popen("xclip -silent -in -selection clipboard", "w")
  pipe:write(bookmark)
  pipe:close()
  mp.osd_message("Link to position copied to clipboard")
end

local function isempty(s)
  return s == nil or s == ''
end

function sharePermalink()
  local pos = mp.get_property_number("time-pos")
  local uri = mp.get_property("path")
  local yt_id_letter = "[%a%d%-_]"
  local yt_id_patterm = string.rep(yt_id_letter, 11)
  local id = string.match(uri, "(" .. yt_id_patterm .. ")%.%a%a.$")
  -- mp.osd_message(id, 5)

  if isempty(id) then
    -- %q might not be fully robust
    -- local bookmark = string.format("mpv --start=%s %q", pos, uri)
    bookmark = string.format("%s&t=%i", uri, pos)
  else
    -- local bookmark = "https://www.youtube.com/watch?v=" .. id .. "&t=" .. pos
    bookmark = string.format("https://www.youtube.com/watch?v=%s&t=%i", id, pos)
  end
  -- mp.osd_message(bookmark, 5)

  local pipe = io.popen("xclip -silent -in -selection clipboard", "w")
  pipe:write(bookmark)
  pipe:close()
  mp.osd_message("Shareable link with position copied to clipboard")
end

function shareYoutubeUrl()
  local uri = mp.get_property("path")
  local yt_id_letter = "[%a%d%-_]"
  local yt_id_patterm = string.rep(yt_id_letter, 11)
  local id = string.match(uri, "(" .. yt_id_patterm .. ")%.%a%a.$")
  -- mp.osd_message(id, 5)

  if isempty(id) then
    -- %q might not be fully robust
    -- local bookmark = string.format("mpv --start=%s %q", pos, uri)
    bookmark = uri
  else
    -- local bookmark = "https://www.youtube.com/watch?v=" .. id .. "&t=" .. pos
    bookmark = string.format("https://www.youtube.com/watch?v=%s", id)
  end
  -- mp.osd_message(bookmark, 5)

  local pipe = io.popen("xclip -silent -in -selection clipboard", "w")
  pipe:write(bookmark)
  pipe:close()
  mp.osd_message("Shareable link copied to clipboard")
end

-- mp.register_script_message("copy-permalink", copyPermalink)
-- mp.add_key_binding("shift+SPACE", "copy-permalink", copyPermalink)
mp.add_key_binding("ctrl+SPACE", "share-permalink", sharePermalink)
mp.add_key_binding("ctrl+z", "share-youtube-url", shareYoutubeUrl)
