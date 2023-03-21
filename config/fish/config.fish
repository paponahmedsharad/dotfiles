if status is-interactive
  # find directory
  fzf_configure_bindings --directory=\cf --variables=\e\cv
  # add key bindings to find file with fzf and open it in vim
  bind \cv 'fzf --preview "bat --color=always --style=numbers --line-range :500 {}" | xargs -r nvim'
  # bind \ct fzf
end

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


# Some config
set -g fish_greeting
# Git config
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_dirtystate '✚'
set -g __fish_git_prompt_char_invalidstate '✖'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_stashstate '⚑'
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_char_upstream_ahead ''
set -g __fish_git_prompt_char_upstream_behind ''
set -g __fish_git_prompt_char_upstream_diverged 'ﱟ'
set -g __fish_git_prompt_char_upstream_equal ''
set -g __fish_git_prompt_char_upstream_prefix ''''


# Directory abbreviations
# abbr -a -g l 'lsd'
# abbr -a -g la 'ls -a'
# abbr -a -g ll 'ls -l'
# abbr -a -g lal 'ls -al'
# abbr -a -g d 'dirs'
# abbr -a -g h 'cd $HOME'
#

# general
abbr -a -g test 'Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome'

# pacman
abbr -a -g pas 'pacman -Slq | fzf | xargs -r sudo pacman -S'

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Exports
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Term
switch "$TERM_EMULATOR"
case '*kitty*'
	export TERM='xterm-kitty'
case '*'
	export TERM='xterm-256color'
end


# User abbreviations
abbr -a -g ytmp3 'youtube-dl --extract-audio --audio-format mp3'				# Convert/Download YT videos as mp3
abbr -a -g h 'history'																								# Show history
abbr -a -g upd 'paru -Syu --noconfirm'																								# Update everything
abbr -a -g fucking 'sudo'																						# Rude way to sudo
abbr -a -g ar 'echo "awesome.restart()" | awesome-client'							# Reload AwesomeWM
abbr -a -g shinei 'kill -9'																						# Kill ala DIO
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
abbr -a -g vw "nvim -O index.html -c sp style.css"
# abbr -a -g ff 'firefox'																								#

# Source plugins
# Useful plugins: archlinux bang-bang cd colorman sudope vcs
if test -d "$HOME/.local/share/omf/pkg/colorman/"
	source ~/.local/share/omf/pkg/colorman/init.fish
end

# Make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end

# Get terminal emulator
set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')

# Neofetch
switch "$TERM_EMULATOR"
case '*xterm*'
	nitch --backend 'kitty'
        # case '*tmux*' '*login*' '*sshd*' '*konsole*'
        # 	neofetch --backend 'ascii' --ascii_distro 'arch_small'
        # case '*'
        # 	nitch --backend 'w3m' --xoffset 34 --yoffset 34 --gap 0
end

starship init fish | source


##################### Aias ####################
# [ -f "$HOME/.config/fish/aliasrc" ] && source "$HOME/.config/fish/aliasrc"
#───────────────────────── ALIASRC ─────────────────────────────
alias cd..="cd .."
alias ccc="clear"
alias l="lsd"
# alias ls="ls --color=auto"
alias ls="exa --icons -G"
alias tree="exa -T"
alias la="ls -a"
alias ll="ls -la"
alias rr="rm -rf"
alias cp="cp -r"
alias cf="cd ~/.config"
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias chadwm='startx ~/.config/chadwm/scripts/run.sh'
alias awe="cd ~/.config/awesome/config"
alias aw="cd ~/.config/awesome/"
# ------------- pacman/program -----------------
alias ii="pacman -S"
alias ss="pacman -Ss"
alias pi="paru -S"
alias ps="paru -Ss"
alias pars="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro  paru -S"
alias kc="kcolorchooser"
alias up="yes | sudo pacman -Syu"
alias update="yes | sudo pacman -Syyu"
alias prm="yes | sudo pacman -Rns"
alias pacman="sudo pacman --color auto"
alias ys="yay -Ss"
alias yi="yay -S"

#---------------- vi/location ------------------
alias v="nvim"
alias vv="nvim -p *"
# alias vw="nvim -O index.html -c sp style.css"
alias vi="vim"
alias svim="sudo nvim"
alias vrc="vim ~/.vimrc"
alias zrc="nvim ~/.zshrc"
alias brc="nvim ~/.bashrc"
alias arc="nvim ~/.config/fish/aliasrc"
alias i3c="nvim ~/.config/i3/config"
alias pbc="nvim ~/.config/polybar/config"
alias fc="nvim $HOME/.config/fish/config.fish"
alias nc="cd ~/.config/nvim/ && nvim init.lua" #--> nvim config
alias lc="cd ~/.config/lazyy/ && nvim init.lua" #--> nvim config
alias qc="cd ~/.config/qtile/ && nvim config.py" #--> qtile config
alias ac="cd ~/.config/awesome/ && nvim rc.lua" #--> awesome config
alias pppp="nvim /tmp/test.py"
alias ppp="cd ~/workspace/practice/"
alias lserver='browser-sync . -w -b firefox-developer-edition'
alias makep="touch index.html style.css main.js && nvim *"
alias lll="nvim /tmp/test.lua"
alias ttt="nvim /tmp/app.ts"
alias ppy="python /tmp/test.py"
alias hhh="nvim /tmp/index.html"
alias jjj="nvim /tmp/main.js"
alias www="cd ~/workspace"
alias lsp="cd ~/.config/nvim/lua/lsp/ && nvim init.lua"
alias line="find . -name '*.lua' | xargs wc -l"
alias nv="neovide --noidle"
# -------------- git ---------------------
alias gac="git add . && git commit -m "
alias gp="git push"
alias gc="git clone --depth=1"
alias gch="git clone --depth=1 https://github.com/"

#--> Colorize the grep command
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

#-------------- others ----------------
alias df="df -h" # readable output
alias free="free -mt" #free space of system
alias unlock="sudo rm /var/lib/pacman/db.lck" #pacman unlock
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
alias userlist="cut -d: -f1 /etc/passwd" #userlist
alias merge="xrdb -merge ~/.Xresources" #merge new settings
alias psa="ps auxf" #ps
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias sysinfo="inxi -Fxz"
alias rrr="cd ~/.recon"
alias fetch="bash ~/.config/fetch | lolcat"
alias mkdir="mkdir -p"

# -------------- application --------------
alias brp="~/.Burp/burp.sh"
alias dvwa="docker run --rm -it -p 80:80 vulnerables/web-dvwa"

# -------------- autocomplete/execute --------------
bind --mode default \e\x20 forward-bigword execute
bind \ef forward-word
bind \e\; forward-bigword
bind \ej execute
# bind \cf forward-word



#──────────────────────────TTY-1──────────────────────────#
if [ (tty) = /dev/tty1 ]
    # pgrep awesome; or startx "$XDG_CONFIG_HOME.xinitrc"
   Hyprland
end

# please.py

# setup NVIM_APPNAME variable
# set -x NVIM_APPNAME "sharad"
# set -x NVIM_APPNAME "lazyy"
# set -x NVIM_APPNAME "sharad"
# set -x NVIM_APPNAME
# stdpath('config') "~/.config/sharad"

