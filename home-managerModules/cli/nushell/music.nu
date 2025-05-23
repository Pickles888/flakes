def getFuzzyMatched [
  path: path
  matched: string
] {
  ls $path | get name | where {|y| $matched in $y} | get 0
}

def runPlaylist [
  path: path
  loop: bool
] {
  if $loop {
    mpv --loop-playlist=inf ...(glob $"($path)/*.{flac,mp3,fla,ogg,wav,m4a}" | sort) 
  } else { 
    mpv ...(glob $"($path)/*.{flac,mp3,fla,ogg,wav,m4a}" | sort) 
	}
}

def runMulti [
	paths: list<path>
] {
	mpv --loop-playlist=inf ...($paths | each {|path| glob $"($path)/*.{flac,mp3,fla,ogg,wav,m4a}" | sort} | flatten)
} 

def select [
  path: path
] {
    let selected = ls $path | get name | each {|x| $x | path basename} | str join "\n" | fzf --preview $"ls \(\"($path)\" | path join \{\}\) | get name | each {|x| ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 $x} | str join \"\\n\""
    getFuzzyMatched $path $selected
}

def multiSelect [
	path: path
] {	
	let selected = ls $path | get name | each {|x| $x | path basename} | str join "\n" | fzf --preview $"ls \(\"($path)\" | path join \{\}\) | get name | each {|x| ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 $x} | str join \"\\n\"" --multi | split row "\n"
	$selected | each {|x| getFuzzyMatched $path $x}		
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
	--multi (-m)
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
    if (not $multi) {
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
		} else {
	  	let albums = multiSelect $type

	   	runMulti $albums
		}
	}
}

def playcd [
	--no-loop (-n)	
	cdPath?: path
] {
	mkdir -v /tmp/mount
	print $"mounting ($cdPath | default "/dev/sr0") to /tmp/mount"
	sudo mount $"($cdPath | default "/dev/sr0")" /tmp/mount 

	runPlaylist /tmp/mount (not $no_loop)

	print "unmounting /tmp/mount"	
	sudo umount /tmp/mount
	rm /tmp/mount
}

# REQUIRES cdrtools dvdplusrwtools

def burncd [
	folderPath: path
	cdPath?: path
] {
	mkisofs -o /tmp/burn.iso $folderPath
	growisofs -dvd-compat -Z $"($cdPath | default "/dev/sr0")=/tmp/burn.iso"
	rm /tmp/burn.iso
}

def musicd [
	cdName?: string  # i.e. sr0
	--eject (-e)
] {
	loop {
		if (lsblk | find ($cdName | default "sr0") | length) > 0 {
			if (lsblk -fpp | split row "\n" | where $it =~ sr0 | split row " " | where $it != "" | length) > 1 {	
				playcd
				if $eject {
					sudo eject $"/dev/($cdName | default "sr0")"
				}
			}
		}

		sleep 2sec
	} 
}
