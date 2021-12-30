function download-playlist --wraps=yt-dlp\ -o\ \'\%\(playlist_index\)s\ -\ \%\(title\)s-\%\(id\)s.\%\(ext\)s\'\ --embed-thumbnail\ --add-metadata\ --sub-lang\ en,de\ --embed-subs\ --write-auto-sub --description alias\ download-playlist\ yt-dlp\ -o\ \'\%\(playlist_index\)s\ -\ \%\(title\)s-\%\(id\)s.\%\(ext\)s\'\ --embed-thumbnail\ --add-metadata\ --sub-lang\ en,de\ --embed-subs\ --write-auto-sub
  yt-dlp -o '%(playlist_index)s - %(title)s-%(id)s.%(ext)s' --merge-output-format mkv --embed-thumbnail --add-metadata --sub-lang en,de --embed-subs --write-auto-sub  $argv;
end
