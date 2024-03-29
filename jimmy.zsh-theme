function pws {
	(( spare_width = ${COLUMNS} ))
  prompt=" "
  
  path_size=${#PWD}
  (( spare_width = ${spare_width} - (${path_size} - 10) ))

  while [ ${#prompt} -lt $spare_width ]; do
    prompt=" $prompt"
  done
  
  prompt="$prompt%~"
	echo $prompt
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

PROMPT='$(pws)
$(prompt_indicator) '
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[blue]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}\Ue0a0%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_FONT="JetBrains Mono"
