typeset -g _git_info=""
typeset -g _git_info_pid=0
typeset -g _git_info_tmp=""

function _git_info_compute() {
  local ref
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return

  local branch=${ref#refs/heads/}
  local gitst
  gitst=$(git status --porcelain -b 2>/dev/null)

  local pairname=${${${GIT_AUTHOR_EMAIL#pair+}%@github.com}//+/\/}
  [[ $pairname == 'ch' || -z $pairname ]] && pairname='' || pairname=" ($pairname)"

  local gitstatus=''
  if [[ -f .git/MERGE_HEAD ]]; then
    if echo "$gitst" | grep -qE '^(UU|AA|DD)'; then
      gitstatus=" %F{red}unmerged%f"
    else
      gitstatus=" %F{green}merged%f"
    fi
  elif echo "$gitst" | grep -qE '^[MADRCU]'; then
    gitstatus=" %F{blue}!%f"
  elif echo "$gitst" | grep -qE '^ [MD]'; then
    gitstatus=" %F{red}!%f"
  elif echo "$gitst" | grep -q '\[ahead'; then
    gitstatus=" %F{yellow}*%f"
  fi

  echo "%B%F{green}/${branch}%f%b${gitstatus}${pairname}"
}

function _git_info_precmd() {
  [[ $_git_info_pid -ne 0 ]] && kill $_git_info_pid 2>/dev/null
  _git_info_tmp=$(mktemp /tmp/zsh_git_XXXXXX)
  local parent_pid=$$
  ( _git_info_compute > "$_git_info_tmp"; kill -USR1 "$parent_pid" 2>/dev/null ) &!
  _git_info_pid=$!
}

TRAPUSR1() {
  [[ -f ${_git_info_tmp:-} ]] && {
    _git_info=$(<"$_git_info_tmp")
    rm -f "$_git_info_tmp"
    _git_info_tmp=""
    _git_info_pid=0
  }
  [[ -o zle ]] && zle reset-prompt
}

function git_prompt_info() {
  echo "$_git_info"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _git_info_precmd

function current_location {
  echo "%15<..<%~%<<"
}

function user_host_pair {
  echo "%{${fg_bold[blue]}%}%n@%15>..>%M%<<%{${reset_color}%}"
}

PROMPT=' $(user_host_pair) $(current_location) $(git_prompt_info)%{${reset_color}%}> '
