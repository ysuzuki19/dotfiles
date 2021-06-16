# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# load aliases from .bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

stty stop undef
stty start undef

GREEN="\[\e[1;32m\]"
PURPLE="\[\e[1;34m\]"
COLOR_END="\[\e[0m\]"
export PS1="${PURPLE}\w ${GREEN}\$ ${COLOR_END}"

export TF_FORCE_GPU_ALLOW_GROWTH=true

export LC_ALL=en_US.UTF-8
export GOPATH="${HOME}/Go"
export NPM_PACKAGES="${HOME}/.npm-packages"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/cuda/lib64"


export PATH="${PATH}:/usr/local/go/bin"
export PATH="${PATH}:${GOPATH}/bin"
export PATH="${PATH}:${NPM_PACKAGES}/bin"
export PATH="${PATH}:${HOME}/.npm/bin"
export PATH="${PATH}:/usr/local/cuda/bin"
export PATH="${PATH}:${HOME}/Scripts/" # This is User Scripts


export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend

_auto_activate_nested_venv() {
  if [[ ${PWD} != *${HOME}* ]]; then
    return
  fi

  if [[ ${ENV_TYPE} != '' && ${ENV_TYPE} != 'pyenv' ]]; then
    return
  fi

  env_key='.venv'
  search_path=$PWD
  while [ ${search_path} != ${HOME} ]
  do
    if [ -e "${search_path}/${env_key}" ]; then
      env_dir=${search_path##*/}

      if [ ${_VENV_NAME} ] && [ ${env_dir} == ${_VENV_NAME} ]; then
        break;
      fi

      if [ "$VIRTUAL_ENV" != "${search_path}/${env_key}" ]; then
        env_owner=$(stat -c '%U' ${search_path}/${env_key})
        if [ $env_owner != $USER ]; then
          echo '[VENV OWNER]: '$env_owner

          # For security: question if `.env` is third party
          read -p "Do you activate? [y/N]" -n 1 -r
          if [[ ! $REPLY =~ ^[yN]$ ]]; then
            return
          fi

        else
          echo '[ENV OWNER]: '$env_owner
        fi

        ENV_TYPE='pyenv'
        _VENV_NAME=$(basename ${search_path##*/})
        echo Activating virtualenv \"$_VENV_NAME\"...
        VIRTUAL_ENV_DISABLE_PROMPT=1
        source ${search_path}/${env_key}/bin/activate
        _OLD_VIRTUAL_PS1="$PS1"
        PS1="(pyenv $_VENV_NAME)$PS1"
        export PS1
      fi
      break
    fi
    search_path=${search_path%/*}
  done

  if [ ${_VENV_NAME} ] && [ ${HOME} == ${search_path} ]; then
    _VENV_NAME=''
    ENV_TYPE=''
    deactivate
  fi
}

_auto_visualize_nested_node_modules() {
  if [[ ${PWD} != *${HOME}* ]]; then
    return
  fi

  if [[ ${ENV_TYPE} != '' && ${ENV_TYPE} != 'node' ]]; then
    return
  fi

  env_key='node_modules'
  search_path=$PWD
  while [ ${search_path} != ${HOME} ]
  do
    if [ -e "${search_path}/${env_key}" ]; then
      env_dir=${search_path##*/}

      if [ ${_VENV_NAME} ] && [ ${env_dir} == ${_VENV_NAME} ]; then
        break;
      fi

      if [ "$VIRTUAL_ENV" != "${search_path}/${env_key}" ]; then
        env_owner=$(stat -c '%U' ${search_path}/${env_key})

        ENV_TYPE='node'
        _VENV_NAME=$(basename ${search_path##*/})
        echo Now node directory \"$_VENV_NAME\"
        VIRTUAL_ENV_DISABLE_PROMPT=1
        _OLD_VIRTUAL_PS1="$PS1"
        PS1="(node $_VENV_NAME)$PS1"
        export PS1
      fi
      break
    fi
    search_path=${search_path%/*}
  done

  if [ ${_VENV_NAME} ] && [ ${HOME} == ${search_path} ]; then
    ENV_TYPE=''
    _VENV_NAME=''
    PS1=$_OLD_VIRTUAL_PS1
    export PS1
  fi
}
export PROMPT_COMMAND='_auto_activate_nested_venv;_auto_visualize_nested_node_modules'

#figlet -c Bash
