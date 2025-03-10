# Nushell Config File
#
# version = "0.96.1"

# For more information on defining custom themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
# And here is the theme collection
# https://github.com/nushell/nu_scripts/tree/main/themes
let dark_theme = {
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'light_cyan' } else { 'light_gray' } }
    bool: light_cyan
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cell-path: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: { bg: red fg: white }
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_yellow_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b }
    shape_glob_interpolation: cyan_bold
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_purple
}

let light_theme = {
    # color for nushell primitives
    separator: dark_gray
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    # Closures can be used to choose colors for specific values.
    # The value (in this case, a bool) is piped into the closure.
    # eg) {|| if $in { 'dark_cyan' } else { 'dark_gray' } }
    bool: dark_cyan
    int: dark_gray
    filesize: cyan_bold
    duration: dark_gray
    date: purple
    range: dark_gray
    float: dark_gray
    string: dark_gray
    nothing: dark_gray
    binary: dark_gray
    cell-path: dark_gray
    row_index: green_bold
    record: dark_gray
    list: dark_gray
    block: dark_gray
    hints: dark_gray
    search_result: { fg: white bg: red }
    shape_and: purple_bold
    shape_binary: purple_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: green_bold
    shape_custom: green
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green_bold
    shape_external_resolved: light_purple_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: white bg: red attr: b }
    shape_glob_interpolation: cyan_bold
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: purple_bold
    shape_pipe: purple_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: purple_bold
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_purple
}

$env.LS_COLORS = ("*~=0;38;2;88;91;112:bd=0;38;2;116;199;236;48;2;49;50;68:ca=0:cd=0;38;2;245;194;231;48;2;49;50;68:di=0;38;2;137;180;250:do=0;38;2;17;17;27;48;2;245;194;231:ex=1;38;2;243;139;168:fi=0:ln=0;38;2;245;194;231:mh=0:mi=0;38;2;17;17;27;48;2;243;139;168:no=0:or=0;38;2;17;17;27;48;2;243;139;168:ow=0:pi=0;38;2;17;17;27;48;2;137;180;250:rs=0:sg=0:so=0;38;2;17;17;27;48;2;245;194;231:st=0:su=0:tw=0:*.a=1;38;2;243;139;168:*.c=0;38;2;166;227;161:*.d=0;38;2;166;227;161:*.h=0;38;2;166;227;161:*.m=0;38;2;166;227;161:*.o=0;38;2;88;91;112:*.p=0;38;2;166;227;161:*.r=0;38;2;166;227;161:*.t=0;38;2;166;227;161:*.z=4;38;2;116;199;236:*.7z=4;38;2;116;199;236:*.as=0;38;2;166;227;161:*.bc=0;38;2;88;91;112:*.bz=4;38;2;116;199;236:*.cc=0;38;2;166;227;161:*.cp=0;38;2;166;227;161:*.cr=0;38;2;166;227;161:*.cs=0;38;2;166;227;161:*.di=0;38;2;166;227;161:*.el=0;38;2;166;227;161:*.ex=0;38;2;166;227;161:*.fs=0;38;2;166;227;161:*.go=0;38;2;166;227;161:*.gv=0;38;2;166;227;161:*.gz=4;38;2;116;199;236:*.hh=0;38;2;166;227;161:*.hi=0;38;2;88;91;112:*.hs=0;38;2;166;227;161:*.jl=0;38;2;166;227;161:*.js=0;38;2;166;227;161:*.ko=1;38;2;243;139;168:*.kt=0;38;2;166;227;161:*.la=0;38;2;88;91;112:*.ll=0;38;2;166;227;161:*.lo=0;38;2;88;91;112:*.md=0;38;2;249;226;175:*.ml=0;38;2;166;227;161:*.mn=0;38;2;166;227;161:*.nb=0;38;2;166;227;161:*.pl=0;38;2;166;227;161:*.pm=0;38;2;166;227;161:*.pp=0;38;2;166;227;161:*.ps=0;38;2;243;139;168:*.py=0;38;2;166;227;161:*.rb=0;38;2;166;227;161:*.rm=0;38;2;242;205;205:*.rs=0;38;2;166;227;161:*.sh=0;38;2;166;227;161:*.so=1;38;2;243;139;168:*.td=0;38;2;166;227;161:*.ts=0;38;2;166;227;161:*.ui=0;38;2;249;226;175:*.vb=0;38;2;166;227;161:*.wv=0;38;2;242;205;205:*.xz=4;38;2;116;199;236:*.aif=0;38;2;242;205;205:*.ape=0;38;2;242;205;205:*.apk=4;38;2;116;199;236:*.arj=4;38;2;116;199;236:*.asa=0;38;2;166;227;161:*.aux=0;38;2;88;91;112:*.avi=0;38;2;242;205;205:*.awk=0;38;2;166;227;161:*.bag=4;38;2;116;199;236:*.bak=0;38;2;88;91;112:*.bat=1;38;2;243;139;168:*.bbl=0;38;2;88;91;112:*.bcf=0;38;2;88;91;112:*.bib=0;38;2;249;226;175:*.bin=4;38;2;116;199;236:*.blg=0;38;2;88;91;112:*.bmp=0;38;2;242;205;205:*.bsh=0;38;2;166;227;161:*.bst=0;38;2;249;226;175:*.bz2=4;38;2;116;199;236:*.c++=0;38;2;166;227;161:*.cfg=0;38;2;249;226;175:*.cgi=0;38;2;166;227;161:*.clj=0;38;2;166;227;161:*.com=1;38;2;243;139;168:*.cpp=0;38;2;166;227;161:*.css=0;38;2;166;227;161:*.csv=0;38;2;249;226;175:*.csx=0;38;2;166;227;161:*.cxx=0;38;2;166;227;161:*.deb=4;38;2;116;199;236:*.def=0;38;2;166;227;161:*.dll=1;38;2;243;139;168:*.dmg=4;38;2;116;199;236:*.doc=0;38;2;243;139;168:*.dot=0;38;2;166;227;161:*.dox=0;38;2;148;226;213:*.dpr=0;38;2;166;227;161:*.elc=0;38;2;166;227;161:*.elm=0;38;2;166;227;161:*.epp=0;38;2;166;227;161:*.eps=0;38;2;242;205;205:*.erl=0;38;2;166;227;161:*.exe=1;38;2;243;139;168:*.exs=0;38;2;166;227;161:*.fls=0;38;2;88;91;112:*.flv=0;38;2;242;205;205:*.fnt=0;38;2;242;205;205:*.fon=0;38;2;242;205;205:*.fsi=0;38;2;166;227;161:*.fsx=0;38;2;166;227;161:*.gif=0;38;2;242;205;205:*.git=0;38;2;88;91;112:*.gvy=0;38;2;166;227;161:*.h++=0;38;2;166;227;161:*.hpp=0;38;2;166;227;161:*.htc=0;38;2;166;227;161:*.htm=0;38;2;249;226;175:*.hxx=0;38;2;166;227;161:*.ico=0;38;2;242;205;205:*.ics=0;38;2;243;139;168:*.idx=0;38;2;88;91;112:*.ilg=0;38;2;88;91;112:*.img=4;38;2;116;199;236:*.inc=0;38;2;166;227;161:*.ind=0;38;2;88;91;112:*.ini=0;38;2;249;226;175:*.inl=0;38;2;166;227;161:*.ipp=0;38;2;166;227;161:*.iso=4;38;2;116;199;236:*.jar=4;38;2;116;199;236:*.jpg=0;38;2;242;205;205:*.kex=0;38;2;243;139;168:*.kts=0;38;2;166;227;161:*.log=0;38;2;88;91;112:*.ltx=0;38;2;166;227;161:*.lua=0;38;2;166;227;161:*.m3u=0;38;2;242;205;205:*.m4a=0;38;2;242;205;205:*.m4v=0;38;2;242;205;205:*.mid=0;38;2;242;205;205:*.mir=0;38;2;166;227;161:*.mkv=0;38;2;242;205;205:*.mli=0;38;2;166;227;161:*.mov=0;38;2;242;205;205:*.mp3=0;38;2;242;205;205:*.mp4=0;38;2;242;205;205:*.mpg=0;38;2;242;205;205:*.nix=0;38;2;249;226;175:*.odp=0;38;2;243;139;168:*.ods=0;38;2;243;139;168:*.odt=0;38;2;243;139;168:*.ogg=0;38;2;242;205;205:*.org=0;38;2;249;226;175:*.otf=0;38;2;242;205;205:*.out=0;38;2;88;91;112:*.pas=0;38;2;166;227;161:*.pbm=0;38;2;242;205;205:*.pdf=0;38;2;243;139;168:*.pgm=0;38;2;242;205;205:*.php=0;38;2;166;227;161:*.pid=0;38;2;88;91;112:*.pkg=4;38;2;116;199;236:*.png=0;38;2;242;205;205:*.pod=0;38;2;166;227;161:*.ppm=0;38;2;242;205;205:*.pps=0;38;2;243;139;168:*.ppt=0;38;2;243;139;168:*.pro=0;38;2;148;226;213:*.ps1=0;38;2;166;227;161:*.psd=0;38;2;242;205;205:*.pyc=0;38;2;88;91;112:*.pyd=0;38;2;88;91;112:*.pyo=0;38;2;88;91;112:*.rar=4;38;2;116;199;236:*.rpm=4;38;2;116;199;236:*.rst=0;38;2;249;226;175:*.rtf=0;38;2;243;139;168:*.sbt=0;38;2;166;227;161:*.sql=0;38;2;166;227;161:*.sty=0;38;2;88;91;112:*.svg=0;38;2;242;205;205:*.swf=0;38;2;242;205;205:*.swp=0;38;2;88;91;112:*.sxi=0;38;2;243;139;168:*.sxw=0;38;2;243;139;168:*.tar=4;38;2;116;199;236:*.tbz=4;38;2;116;199;236:*.tcl=0;38;2;166;227;161:*.tex=0;38;2;166;227;161:*.tgz=4;38;2;116;199;236:*.tif=0;38;2;242;205;205:*.tml=0;38;2;249;226;175:*.tmp=0;38;2;88;91;112:*.toc=0;38;2;88;91;112:*.tsx=0;38;2;166;227;161:*.ttf=0;38;2;242;205;205:*.txt=0;38;2;249;226;175:*.vcd=4;38;2;116;199;236:*.vim=0;38;2;166;227;161:*.vob=0;38;2;242;205;205:*.wav=0;38;2;242;205;205:*.wma=0;38;2;242;205;205:*.wmv=0;38;2;242;205;205:*.xcf=0;38;2;242;205;205:*.xlr=0;38;2;243;139;168:*.xls=0;38;2;243;139;168:*.xml=0;38;2;249;226;175:*.xmp=0;38;2;249;226;175:*.yml=0;38;2;249;226;175:*.zip=4;38;2;116;199;236:*.zsh=0;38;2;166;227;161:*.zst=4;38;2;116;199;236:*TODO=1:*hgrc=0;38;2;148;226;213:*.bash=0;38;2;166;227;161:*.conf=0;38;2;249;226;175:*.dart=0;38;2;166;227;161:*.diff=0;38;2;166;227;161:*.docx=0;38;2;243;139;168:*.epub=0;38;2;243;139;168:*.fish=0;38;2;166;227;161:*.flac=0;38;2;242;205;205:*.h264=0;38;2;242;205;205:*.hgrc=0;38;2;148;226;213:*.html=0;38;2;249;226;175:*.java=0;38;2;166;227;161:*.jpeg=0;38;2;242;205;205:*.json=0;38;2;249;226;175:*.less=0;38;2;166;227;161:*.lisp=0;38;2;166;227;161:*.lock=0;38;2;88;91;112:*.make=0;38;2;148;226;213:*.mpeg=0;38;2;242;205;205:*.opus=0;38;2;242;205;205:*.orig=0;38;2;88;91;112:*.pptx=0;38;2;243;139;168:*.psd1=0;38;2;166;227;161:*.psm1=0;38;2;166;227;161:*.purs=0;38;2;166;227;161:*.rlib=0;38;2;88;91;112:*.sass=0;38;2;166;227;161:*.scss=0;38;2;166;227;161:*.tbz2=4;38;2;116;199;236:*.tiff=0;38;2;242;205;205:*.toml=0;38;2;249;226;175:*.webm=0;38;2;242;205;205:*.webp=0;38;2;242;205;205:*.woff=0;38;2;242;205;205:*.xbps=4;38;2;116;199;236:*.xlsx=0;38;2;243;139;168:*.yaml=0;38;2;249;226;175:*.cabal=0;38;2;166;227;161:*.cache=0;38;2;88;91;112:*.class=0;38;2;88;91;112:*.cmake=0;38;2;148;226;213:*.dyn_o=0;38;2;88;91;112:*.ipynb=0;38;2;166;227;161:*.mdown=0;38;2;249;226;175:*.patch=0;38;2;166;227;161:*.scala=0;38;2;166;227;161:*.shtml=0;38;2;249;226;175:*.swift=0;38;2;166;227;161:*.toast=4;38;2;116;199;236:*.xhtml=0;38;2;249;226;175:*README=0;38;2;30;30;46;48;2;249;226;175:*passwd=0;38;2;249;226;175:*shadow=0;38;2;249;226;175:*.config=0;38;2;249;226;175:*.dyn_hi=0;38;2;88;91;112:*.flake8=0;38;2;148;226;213:*.gradle=0;38;2;166;227;161:*.groovy=0;38;2;166;227;161:*.ignore=0;38;2;148;226;213:*.matlab=0;38;2;166;227;161:*COPYING=0;38;2;147;153;178:*INSTALL=0;38;2;30;30;46;48;2;249;226;175:*LICENSE=0;38;2;147;153;178:*TODO.md=1:*.desktop=0;38;2;249;226;175:*.gemspec=0;38;2;148;226;213:*Doxyfile=0;38;2;148;226;213:*Makefile=0;38;2;148;226;213:*TODO.txt=1:*setup.py=0;38;2;148;226;213:*.DS_Store=0;38;2;88;91;112:*.cmake.in=0;38;2;148;226;213:*.fdignore=0;38;2;148;226;213:*.kdevelop=0;38;2;148;226;213:*.markdown=0;38;2;249;226;175:*.rgignore=0;38;2;148;226;213:*COPYRIGHT=0;38;2;147;153;178:*README.md=0;38;2;30;30;46;48;2;249;226;175:*configure=0;38;2;148;226;213:*.gitconfig=0;38;2;148;226;213:*.gitignore=0;38;2;148;226;213:*.localized=0;38;2;88;91;112:*.scons_opt=0;38;2;88;91;112:*CODEOWNERS=0;38;2;148;226;213:*Dockerfile=0;38;2;249;226;175:*INSTALL.md=0;38;2;30;30;46;48;2;249;226;175:*README.txt=0;38;2;30;30;46;48;2;249;226;175:*SConscript=0;38;2;148;226;213:*SConstruct=0;38;2;148;226;213:*.gitmodules=0;38;2;148;226;213:*.synctex.gz=0;38;2;88;91;112:*.travis.yml=0;38;2;166;227;161:*INSTALL.txt=0;38;2;30;30;46;48;2;249;226;175:*LICENSE-MIT=0;38;2;147;153;178:*MANIFEST.in=0;38;2;148;226;213:*Makefile.am=0;38;2;148;226;213:*Makefile.in=0;38;2;88;91;112:*.applescript=0;38;2;166;227;161:*.fdb_latexmk=0;38;2;88;91;112:*CONTRIBUTORS=0;38;2;30;30;46;48;2;249;226;175:*appveyor.yml=0;38;2;166;227;161:*configure.ac=0;38;2;148;226;213:*.clang-format=0;38;2;148;226;213:*.gitattributes=0;38;2;148;226;213:*.gitlab-ci.yml=0;38;2;166;227;161:*CMakeCache.txt=0;38;2;88;91;112:*CMakeLists.txt=0;38;2;148;226;213:*LICENSE-APACHE=0;38;2;147;153;178:*CONTRIBUTORS.md=0;38;2;30;30;46;48;2;249;226;175:*.sconsign.dblite=0;38;2;88;91;112:*CONTRIBUTORS.txt=0;38;2;30;30;46;48;2;249;226;175:*requirements.txt=0;38;2;148;226;213:*package-lock.json=0;38;2;88;91;112:*.CFUserTextEncoding=0;38;2;88;91;112" | str trim)

# External completer example
let carapace_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}

# The default config record. This is where much of your global configuration is setup.
$env.config = {
    show_banner: false # true or false to enable or disable the welcome banner at startup

    ls: {
        use_ls_colors: true # use the LS_COLORS environment variable to colorize output
        clickable_links: true # enable or disable clickable links. Your terminal has to support links.
    }

    rm: {
        always_trash: false # always act as if -t was given. Can be overridden with -p
    }

    table: {
        mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
        index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
        show_empty: true # show 'empty list' and 'empty record' placeholders for command output
        padding: { left: 1, right: 1 } # a left right padding of each column in a table
        trim: {
            methodology: wrapping # wrapping or truncating
            wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
            truncating_suffix: "..." # A suffix used by the 'truncating' methodology
        }
        header_on_separator: false # show header text on separator/border line
        # abbreviated_row_count: 10 # limit data rows from top and bottom after reaching a set point
    }

    error_style: "fancy" # "fancy" or "plain" for screen reader-friendly error messages

    # datetime_format determines what a datetime rendered in the shell would look like.
    # Behavior without this configuration point will be to "humanize" the datetime display,
    # showing something like "a day ago."
    datetime_format: {
        # normal: '%a, %d %b %Y %H:%M:%S %z'    # shows up in displays of variables or other datetime's outside of tables
        # table: '%m/%d/%y %I:%M:%S%p'          # generally shows up in tabular outputs such as ls. commenting this out will change it to the default human readable datetime format
    }

    explore: {
        status_bar_background: { fg: "#1D1F21", bg: "#C4C9C6" },
        command_bar_text: { fg: "#C4C9C6" },
        highlight: { fg: "black", bg: "yellow" },
        status: {
            error: { fg: "white", bg: "red" },
            warn: {}
            info: {}
        },
        selected_cell: { bg: light_blue },
    }

    history: {
        max_size: 100_000 # Session has to be reloaded for this to take effect
        sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
        file_format: "plaintext" # "sqlite" or "plaintext"
        isolation: false # only available with sqlite file_format. true enables history isolation, false disables it. true will allow the history to be isolated to the current session using up/down arrows. false will allow the history to be shared across all sessions.
    }

    completions: {
        case_sensitive: true # set to true to enable case-sensitive completions
        quick: true    # set this to false to prevent auto-selecting completions when only one remains
        partial: true    # set this to false to prevent partial filling of the prompt
        algorithm: "fuzzy"    # prefix or fuzzy
        sort: "smart" # "smart" (alphabetical for prefix matching, fuzzy score for fuzzy matching) or "alphabetical"
        external: {
            enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up may be very slow
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: $carapace_completer # check 'carapace_completer' above as an example
        }
        use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
    }

    filesize: {
        unit: "metric" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, auto
    }

    cursor_shape: {
        emacs: line # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (line is the default)
        vi_insert: block # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (block is the default)
        vi_normal: underscore # block, underscore, line, blink_block, blink_underscore, blink_line, inherit to skip setting cursor shape (underscore is the default)
    }

    color_config: $dark_theme # if you want a more interesting theme, you can replace the empty record with `$dark_theme`, `$light_theme` or another custom record
    footer_mode: 25 # always, never, number_of_rows, auto
    float_precision: 2 # the precision for displaying floats in tables
    buffer_editor: null # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
    use_ansi_coloring: true
    bracketed_paste: true # enable bracketed paste, currently useless on windows
    edit_mode: emacs # emacs, vi
    shell_integration: {
        # osc2 abbreviates the path if in the home_dir, sets the tab/window title, shows the running command in the tab/window title
        osc2: true
        # osc7 is a way to communicate the path to the terminal, this is helpful for spawning new tabs in the same directory
        osc7: true
        # osc8 is also implemented as the deprecated setting ls.show_clickable_links, it shows clickable links in ls output if your terminal supports it. show_clickable_links is deprecated in favor of osc8
        osc8: true
        # osc9_9 is from ConEmu and is starting to get wider support. It's similar to osc7 in that it communicates the path to the terminal
        osc9_9: false
        # osc133 is several escapes invented by Final Term which include the supported ones below.
        # 133;A - Mark prompt start
        # 133;B - Mark prompt end
        # 133;C - Mark pre-execution
        # 133;D;exit - Mark execution finished with exit code
        # This is used to enable terminals to know where the prompt is, the command is, where the command finishes, and where the output of the command is
        osc133: true
        # osc633 is closely related to osc133 but only exists in visual studio code (vscode) and supports their shell integration features
        # 633;A - Mark prompt start
        # 633;B - Mark prompt end
        # 633;C - Mark pre-execution
        # 633;D;exit - Mark execution finished with exit code
        # 633;E - NOT IMPLEMENTED - Explicitly set the command line with an optional nonce
        # 633;P;Cwd=<path> - Mark the current working directory and communicate it to the terminal
        # and also helps with the run recent menu in vscode
        osc633: true
        # reset_application_mode is escape \x1b[?1l and was added to help ssh work better
        reset_application_mode: true
    }
    render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.
    use_kitty_protocol: false # enables keyboard enhancement protocol implemented by kitty console, only if your terminal support this.
    highlight_resolved_externals: false # true enables highlighting of external commands in the repl resolved by which.
    recursion_limit: 50 # the maximum number of times nushell allows recursion before stopping it

    plugins: {} # Per-plugin configuration. See https://www.nushell.sh/contributor-book/plugins.html#configuration.

    plugin_gc: {
        # Configuration for plugin garbage collection
        default: {
            enabled: true # true to enable stopping of inactive plugins
            stop_after: 10sec # how long to wait after a plugin is inactive to stop it
        }
        plugins: {
            # alternate configuration for specific plugins, by name, for example:
            #
            # gstat: {
            #     enabled: false
            # }
        }
    }

    hooks: {
        pre_prompt: [{ null }] # run before the prompt is shown
        pre_execution: [{ null }] # run before the repl input is run
        env_change: {
            PWD: [{|before, after| null }] # run if the PWD environment is different since the last repl input
        }
        display_output: "if (term size).columns >= 100 { table -e } else { table }" # run to display the output of a pipeline
        command_not_found: { null } # return an error message when a command is not found
    }

    menus: [
        # Configuration for default nushell menus
        # Note the lack of source parameter
        {
            name: completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: columnar
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
            }
            style: {
                text: green
                selected_text: { attr: r }
                description_text: yellow
                match_text: { attr: u }
                selected_match_text: { attr: ur }
            }
        }
        {
            name: ide_completion_menu
            only_buffer_difference: false
            marker: "| "
            type: {
                layout: ide
                min_completion_width: 0,
                max_completion_width: 50,
                max_completion_height: 10, # will be limited by the available lines in the terminal
                padding: 0,
                border: true,
                cursor_offset: 0,
                description_mode: "prefer_right"
                min_description_width: 0
                max_description_width: 50
                max_description_height: 10
                description_offset: 1
                # If true, the cursor pos will be corrected, so the suggestions match up with the typed text
                #
                # C:\> str
                #      str join
                #      str trim
                #      str split
                correct_cursor_pos: false
            }
            style: {
                text: green
                selected_text: { attr: r }
                description_text: yellow
                match_text: { attr: u }
                selected_match_text: { attr: ur }
            }
        }
        {
            name: history_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: list
                page_size: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
        {
            name: help_menu
            only_buffer_difference: true
            marker: "? "
            type: {
                layout: description
                columns: 4
                col_width: 20     # Optional value. If missing all the screen width is used to calculate column width
                col_padding: 2
                selection_rows: 4
                description_rows: 10
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
        }
    ]

    keybindings: [
        {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: ide_completion_menu
            modifier: control
            keycode: char_n
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: ide_completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: history_menu
            modifier: control
            keycode: char_r
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: history_menu }
        }
        {
            name: help_menu
            modifier: none
            keycode: f1
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: help_menu }
        }
        {
            name: completion_previous_menu
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menuprevious }
        }
        {
            name: next_page_menu
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page_menu
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
        {
            name: escape
            modifier: none
            keycode: escape
            mode: [emacs, vi_normal, vi_insert]
            event: { send: esc }    # NOTE: does not appear to work
        }
        {
            name: cancel_command
            modifier: control
            keycode: char_c
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrlc }
        }
        {
            name: quit_shell
            modifier: control
            keycode: char_d
            mode: [emacs, vi_normal, vi_insert]
            event: { send: ctrld }
        }
        {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
        {
            name: search_history
            modifier: control
            keycode: char_q
            mode: [emacs, vi_normal, vi_insert]
            event: { send: searchhistory }
        }
        {
            name: open_command_editor
            modifier: control
            keycode: char_o
            mode: [emacs, vi_normal, vi_insert]
            event: { send: openeditor }
        }
        {
            name: move_up
            modifier: none
            keycode: up
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: none
            keycode: down
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: move_left
            modifier: none
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuleft }
                    { send: left }
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: none
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: control
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: control
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: none
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: char_a
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: none
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: control
            keycode: char_e
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end
            modifier: control
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolineend }
        }
        {
            name: move_up
            modifier: control
            keycode: char_p
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: control
            keycode: char_t
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: delete_one_character_backward
            modifier: none
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspace }
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: delete_one_character_forward
            modifier: none
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: delete_one_character_forward
            modifier: control
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: delete_one_character_backward
            modifier: control
            keycode: char_h
            mode: [emacs, vi_insert]
            event: { edit: backspace }
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: char_w
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: move_left
            modifier: none
            keycode: backspace
            mode: vi_normal
            event: { edit: moveleft }
        }
        {
            name: newline_or_run_command
            modifier: none
            keycode: enter
            mode: emacs
            event: { send: enter }
        }
        {
            name: move_left
            modifier: control
            keycode: char_b
            mode: emacs
            event: {
                until: [
                    { send: menuleft }
                    { send: left }
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: control
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }
        {
            name: redo_change
            modifier: control
            keycode: char_g
            mode: emacs
            event: { edit: redo }
        }
        {
            name: undo_change
            modifier: control
            keycode: char_z
            mode: emacs
            event: { edit: undo }
        }
        {
            name: paste_before
            modifier: control
            keycode: char_y
            mode: emacs
            event: { edit: pastecutbufferbefore }
        }
        {
            name: cut_word_left
            modifier: control
            keycode: char_w
            mode: emacs
            event: { edit: cutwordleft }
        }
        {
            name: cut_line_to_end
            modifier: control
            keycode: char_k
            mode: emacs
            event: { edit: cuttoend }
        }
        {
            name: cut_line_from_start
            modifier: control
            keycode: char_u
            mode: emacs
            event: { edit: cutfromstart }
        }
        {
            name: swap_graphemes
            modifier: control
            keycode: char_t
            mode: emacs
            event: { edit: swapgraphemes }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: left
            mode: emacs
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: right
            mode: emacs
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: alt
            keycode: char_b
            mode: emacs
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: alt
            keycode: char_f
            mode: emacs
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: delete_one_word_forward
            modifier: alt
            keycode: delete
            mode: emacs
            event: { edit: deleteword }
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: backspace
            mode: emacs
            event: { edit: backspaceword }
        }
        {
            name: delete_one_word_backward
            modifier: alt
            keycode: char_m
            mode: emacs
            event: { edit: backspaceword }
        }
        {
            name: cut_word_to_right
            modifier: alt
            keycode: char_d
            mode: emacs
            event: { edit: cutwordright }
        }
        {
            name: upper_case_word
            modifier: alt
            keycode: char_u
            mode: emacs
            event: { edit: uppercaseword }
        }
        {
            name: lower_case_word
            modifier: alt
            keycode: char_l
            mode: emacs
            event: { edit: lowercaseword }
        }
        {
            name: capitalize_char
            modifier: alt
            keycode: char_c
            mode: emacs
            event: { edit: capitalizechar }
        }
        # The following bindings with `*system` events require that Nushell has
        # been compiled with the `system-clipboard` feature.
        # This should be the case for Windows, macOS, and most Linux distributions
        # Not available for example on Android (termux)
        # If you want to use the system clipboard for visual selection or to
        # paste directly, uncomment the respective lines and replace the version
        # using the internal clipboard.
        {
            name: copy_selection
            modifier: control_shift
            keycode: char_c
            mode: emacs
            event: { edit: copyselection }
            # event: { edit: copyselectionsystem }
        }
        {
            name: cut_selection
            modifier: control_shift
            keycode: char_x
            mode: emacs
            event: { edit: cutselection }
            # event: { edit: cutselectionsystem }
        }
        # {
        #     name: paste_system
        #     modifier: control_shift
        #     keycode: char_v
        #     mode: emacs
        #     event: { edit: pastesystem }
        # }
        {
            name: select_all
            modifier: control_shift
            keycode: char_a
            mode: emacs
            event: { edit: selectall }
        }
    ]
}
