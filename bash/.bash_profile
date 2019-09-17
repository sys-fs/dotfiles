ALTERNATE_EDITOR=""
EDITOR="emacsclient -c"
VISUAL="emacsclient -c -a emacs"
PAGER=less
PATH="$PATH":/sbin:/usr/sbin:/usr/local/sbin:~/.local/bin
PS1="\u@\h:\w \$ "
LPASS_AGENT_TIMEOUT=0
LPASS_CLIPBOARD_COMMAND=xclip
GPG_TTY=$(tty)
SSH_ENV="$HOME/.ssh/environment"

start_agent() {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

export ALTERNATE_EDITOR EDITOR VISUAL PAGER PATH PS1 LPASS_AGENT_TIMEOUT LPASS_CLIPBOARD_COMMAND GPG_TTY

. ~/.bashrc
