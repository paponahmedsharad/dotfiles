if status is-interactive
    set -g fish_greeting
    fzf_configure_bindings --directory=\cf --variables=\e\cv                                               # find directory
    bind \cv 'fzf --preview "bat --color=always --style=numbers --line-range :500 {}" | xargs -r nvim'     # add key bindings to find file with fzf and open it in vim
end


# Source
starship init fish | source                                                                                # prompt
[ -f "$HOME/.config/env.fish" ] && source "$HOME/.config/env.fish" #                                       env variables


# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


# Exports
export VISUAL="nvim"                                                                                       # editor
export EDITOR="$VISUAL"


# Completion
bind --mode default \e\x20 forward-bigword execute                                                          # alt-space
bind \ef forward-word                                                                                       # alt-f
bind \e\; forward-bigword                                                                                   # alt-;
bind \ej execute                                                                                            # alt-j
# bind \cf forward-word                                                                                     # ctrl-f


# Fetch
set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')                      # get the terminal name
if test "$TERM_EMULATOR" = "/usr/bin/wezterm-gui"                                                           # if wezterm run  "something"
    wezterm imgcat ~/.icons/flag1.png                                                                       # png/jpg/gif... insted of neofetch
end


# Make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end



# Colors{{{
# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467C
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7


# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
#}}}

# Git config{{{
# set -g __fish_git_prompt_show_informative_status 1
# set -g __fish_git_prompt_showupstream informative
# set -g __fish_git_prompt_showdirtystate yes
# set -g __fish_git_prompt_char_stateseparator ' '
# set -g __fish_git_prompt_char_cleanstate '✔'
# set -g __fish_git_prompt_char_dirtystate '✚'
# set -g __fish_git_prompt_char_invalidstate '✖'
# set -g __fish_git_prompt_char_stagedstate '●'
# set -g __fish_git_prompt_char_stashstate '⚑'
# set -g __fish_git_prompt_char_untrackedfiles '?'
# set -g __fish_git_prompt_char_upstream_ahead ''
# set -g __fish_git_prompt_char_upstream_behind ''
# set -g __fish_git_prompt_char_upstream_diverged 'ﱟ'
# set -g __fish_git_prompt_char_upstream_equal ''
# set -g __fish_git_prompt_char_upstream_prefix ''''
#}}}

# Abbreviations{{{
# general
abbr -a -g l 'lsd'
abbr -a -g ls 'exa --icons -G'
abbr -a -g la 'ls -a'
abbr -a -g ll 'ls -l'
abbr -a -g lal 'ls -al'
abbr -a -g tree 'exa -T'
abbr -a -g d 'dirs'
abbr -a -g h 'cd $HOME'
abbr -a -g rr 'rm -vrf'
abbr -a -g cp 'cp -vr'
abbr -a -g se 'sudo -e'
abbr -a -g mkdir 'mkdir -p'
abbr -a -g test 'Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome'
abbr -a -g svirt 'sudo systemctl start libvirtd.service'
abbr -a -g line "find . -name '*.lua' | xargs wc -l"

# vim/location
abbr -a -g v 'nvim'
abbr -a -g vw "nvim -O index.html -c sp style.css"
abbr -a -g fc "nvim $HOME/.config/fish/config.fish"
abbr -a -g nc "cd ~/.config/nvim/ && nvim init.lua" #--> nvim config
abbr -a -g wp "cd ~/workspace/practice/"
abbr -a -g py "nvim /tmp/test.py"
abbr -a -g ppy "python /tmp/test.py"
abbr -a -g cf '~/.config/'
abbr -a -g lserver 'browser-sync . -w -b firefox-developer-edition'
abbr -a -g makep "touch index.html style.css main.js && nvim index.html"
abbr -a -g lll "nvim /tmp/test.lua"
abbr -a -g ttt "nvim /tmp/app.ts"
abbr -a -g hhh "nvim /tmp/index.html"
abbr -a -g jjj "nvim /tmp/main.js"
abbr -a -g www "cd ~/workspace"

# git
abbr -a -g gac 'git add . && git commit -m'
abbr -a -g gaa 'git add --all'
abbr -a -g gclr 'git clone --recurse-submodules'
abbr -a -g push 'git push'
abbr -a -g gc 'git clone --depth=1'
abbr -a -g gu 'git clone --depth=1 https://github.com/'

# pacman
abbr -a -g pas 'pacman -Slq | fzf | xargs -r sudo pacman -S'
abbr -a -g pacs "pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
abbr -a -g pacr "pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
abbr -a -g ii 'sudo pacman -S'
abbr -a -g ss 'sudo pacman -Ss'
abbr -a -g update 'yes | sudo pacman -Syyu'
abbr -a -g prm 'sudo pacman -Rns'
abbr -a -g pars "paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro  paru -S"
abbr -a -g p "pacman -Q | fzf"
abbr -a -g pi 'paru -S'
abbr -a -g ps 'paru -Ss'
abbr -a -g yi 'yay -S'
abbr -a -g ys 'yay -Ss'

# User abbreviations
abbr -a -g grubup "sudo grub-mkconfig -o /boot/grub/grub.cfg"
abbr -a -g chadwm 'startx ~/.config/chadwm/scripts/run.sh'
abbr -a -g ytmp3 'youtube-dl --extract-audio --audio-format mp3'				# Convert/Download YT videos as mp3
abbr -a -g upd 'paru -Syu --noconfirm'																								# Update everything
abbr -a -g ar 'echo "awesome.restart()" | awesome-client'							# Reload AwesomeWM
abbr -a -g kv 'kill -9 (pgrep vlc)'																			# Kill zombie vlc
abbr -a -g priv 'fish --private'																				# Fish incognito mode
abbr -a -g sshon 'sudo systemctl start sshd.service'										# Start ssh service
abbr -a -g sshoff 'sudo systemctl stop sshd.service'										# Stop ssh service
abbr -a -g untar 'tar -zxvf'																					# Untar
abbr -a -g genpass 'openssl rand -base64 20'													# Generate a random, 20-charactered password
abbr -a -g sha 'shasum -a 256'																			# Test checksum
abbr -a -g cn 'ping -c 5 8.8.8.8'																			# Ping google, checking network
abbr -a -g ipe 'curl ifconfig.co'																				# Get external IP address
abbr -a -g ips 'ip link show'																					# Get network interfaces information
abbr -a -g wloff 'rfkill block wlan'																			# Block wlan, killing wifi connection
abbr -a -g wlon 'rfkill unblock wlan'																		# Unblock wlan, start wifi connection
abbr -a -g grep "grep --color=auto"
abbr -a -g egrep "egrep --color=auto"
abbr -a -g fgrep "fgrep --color=auto"
#}}}

# Aliasrc{{{
#-------------- others ----------------
alias df="df -h" # readable output
alias free="free -mt" #free space of system
alias unlock="sudo rm /var/lib/pacman/db.lck" #pacman unlock
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
alias userlist="cut -d: -f1 /etc/passwd" #userlist
alias merge="xrdb -merge ~/.Xresources" #merge new settings
alias psa="ps auxf" #ps
# -------------- application --------------
alias brp="~/.Burp/burp.sh"
alias dvwa="docker run --rm -it -p 80:80 vulnerables/web-dvwa"
#}}}



#────────────────────────── TTY-1 ──────────────────────────
if [ (tty) = /dev/tty1 ]
    # pgrep awesome; or startx "$XDG_CONFIG_HOME.xinitrc"
   Hyprland
end


# setup NVIM_APPNAME variable
# set -x NVIM_APPNAME "sharad"
# set -x NVIM_APPNAME

