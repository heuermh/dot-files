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

# add m1 homebrew to path
export PATH=/opt/homebrew/bin:$PATH

# choose jvm
export JAVA_HOME=`/usr/libexec/java_home -v 11`
#export JAVA_HOME=`/usr/libexec/java_home -v 17`
#export JAVA_HOME=`/usr/libexec/java_home -v 18`

