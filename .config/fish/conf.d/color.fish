# Color Palette
set -l foreground a8a19f
set -l black 766e6b
set -l red f22c40
set -l green 5ab738
set -l yellow d5911a
set -l blue 407ee7
set -l magenta 6666ea
set -l cyan 00ad9c
set -l white f1efee

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $blue
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $white
set -g fish_color_error $red
set -g fish_color_param $magenta
set -g fish_color_comment $black
set -g fish_color_selection --background=$red
set -g fish_color_search_match --background=$red
set -g fish_color_operator $green
set -g fish_color_escape $blue
set -g fish_color_autosuggestion $black

## Completion Pager Colors
set -g fish_pager_color_progress $black
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $black