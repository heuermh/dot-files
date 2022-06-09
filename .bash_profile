case ${TERM} in
  xterm*|rxvt*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]';;
  *)
    TITLEBAR='';;
esac;
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
parse_git_dirty () {
  git diff --no-ext-diff --quiet --exit-code &>/dev/null || echo "!"
}
PROMPT_COMMAND=""
PS1="${TITLEBAR}\[\e[0;34m\]\W \[\e[1;34m\]\$(parse_git_branch)\n\
\[\e[0;32m\]\$ \[\e[1;37m\]"

alias ls="ls -G"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
