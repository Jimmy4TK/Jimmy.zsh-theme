# Simple theme based on my old zsh settings.

function kardan {
	(( spare_width = ${COLUMNS} ))
  prompt=" "
  
  ruby_version=$(ruby_prompt_info)
  ruby_size=${#ruby_version}
  path_size=${#PWD}
  
  (( spare_width = ${spare_width} - (${path_size} + ${ruby_size} - 15) ))

  while [ ${#prompt} -lt $spare_width ]; do
    prompt=" $prompt"
  done
  
  prompt="$prompt%~"
  
	echo $prompt
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

PROMPT='$(kardan)
$(prompt_indicator) '
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
