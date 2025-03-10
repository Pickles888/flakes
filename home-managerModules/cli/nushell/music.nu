def getFuzzyMatched [
  path: path
  matched: string
] {
  ls $path | get name | where {|y| $y =~ $matched} | get 0
}

def runPlaylist [
  path: path
  loop: bool
] {
  if $loop {
    bash -c $"mpv --loop-playlist=inf --playlist=<\(find ($path) -type f -iregex \'.*\\.\\\(mp3\\|flac\\|wav\\|ogg\\\)\'\)" # looks cursed af
  } else {
    bash -c $"mpv --playlist=<\(find ($path) -type f -iregex \'.*\\.\\\(mp3\\|flac\\|wav\\|ogg\\\)\'\)" # looks cursed af
  }
}

def select [
  path: path
] {
    let selected = ls $path | get name | each {|x| $x | path basename} | str join "\n" | fzf --preview $"ls \(\"($path)\" | path join \{\}\) | get name | each {|x| ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 $x} | str join \"\\n\""
    getFuzzyMatched $path $selected
}

def selectDir [
  path: path
] {
    let selected = ls $path | get name | each {|x| $x | path basename} | str join "\n" | fzf --preview $"ls \(\"($path)\" | path join \{\}\) | get name | path basename | str join \"\\n\""
    getFuzzyMatched $path $selected
}

def selectSong [
  path: path
] {
    let selected = ls $path | get name | each {|x| ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 $x} | str join "\n" | fzf
    getFuzzyMatched $path $selected
}

def music [
  --playlist (-p)
  --no-loop (-n)
  --single (-s)
] {
  mkdir -v ~/Music/ ~/Music/Albums ~/Music/Playlists ~/Music/Albums/By-Type # create if it doesnt exist

  if $playlist {
    let playlist = select ~/Music/Playlists
    
    if $single {
      if $no_loop {
	mpv (selectSong $playlist)
      } else {
	mpv --loop=inf (selectSong $playlist)
      }
    } else {
      runPlaylist $playlist (not $no_loop)
    }
  } else {
    let type = selectDir ~/Music/Albums/By-Type
    let album = select $type

    if $single {
      if $no_loop {
	mpv (selectSong $album)
      } else {
	mpv --loop=inf (selectSong $album)
      }
    } else {
      runPlaylist $album (not $no_loop)
    }
  }
}
