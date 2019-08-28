# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias emake='make 2>&1 >/dev/null | grep error'
alias emk='make 2>&1 >/dev/null | grep error'
alias tmake="latexmk"
alias x='exit'
alias md='pandoc $1 | lynx -stdin'
alias p='python3'

alias mk="make"
alias mr="make run"
alias mc="make clean"
alias me="make; ./proj"
alias tmx="tmux"

alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
alias tcopy="tmux save-buffer - | xsel --clipboard --input"

alias ｌｓ="ls"
alias stt="cd ~/Study/Myprog/roadT"
alias bset="mkdir build; cd build; cmake ..; make;"
alias cmk="cmake"
alias track="~/Recruit/CodingTest/trackEnv/track"
alias ff="firefox"

alias vim="nvim"
alias vi="nvim"

