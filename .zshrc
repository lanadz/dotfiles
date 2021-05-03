source .aliases

# autoload -Uz colors && colors
autoload -Uz vcs_info
autoload -Uz compinit && compinit

precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'

seasonal_chevrons () {
  local date=$(date)
  local chevrons="▶▶▶"

  case $date in
    # spring
    *Mar*|*Apr*|*May*)
      chevrons="%F{#81D4FA}▶%F{#A5D6A7}▶%F{#FFF59D}▶%f"
      ;;
    # summer
    *Jun*|*Jul*|*Aug*)
      chevrons="%F{#A5D6A7}▶%F{#FFF59D}▶%F{#FFAB91}▶%f"
      ;;
    # fall
    *Sep*|*Oct*|*Nov*)
      chevrons="%F{#E6EE9C}▶%F{#FFCC80}▶%F{#F48FB1}▶%f"
      ;;
    # winter
    *Dec*|*Jan*|*Feb*)
      chevrons="%F{#B39DDB}▶%F{#81D4FA}▶%F{#A5D6A7}▶%f"
      ;;
    *)
      ;;
  esac

  echo -en $chevrons
}

# Return the branch name if we're in a git repo, or nothing otherwise.
git_check () {
  local gitBranch=$(git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/")
  if [[ $gitBranch ]]; then
    echo -en $gitBranch
    return
  fi
}

# Return the status of the current git repo.
git_status () {
  local gitBranch="$(git_check)"
  if [[ $gitBranch ]]; then
    local statusCheck=$(git status 2> /dev/null)
    if [[ $statusCheck =~ 'Your branch is ahead' ]]; then
      echo -en 'ahead'
    elif [[ $statusCheck =~ 'Changes to be committed' ]]; then
      echo -en 'staged'
    elif [[ $statusCheck =~ 'no changes added' ]]; then
      echo -en 'modified'
    elif [[ $statusCheck =~ 'working tree clean' ]]; then
      echo -en 'clean'
    fi
  fi
}

# Return a color based on the current git status.
git_status_color () {
  local gitStatus="$(git_status)"
  local statusText=''
  case $gitStatus in
    clean*)
      statusText="green"
      ;;
    modified*)
      statusText="magenta"
      ;;
    staged*)
      statusText="magenta"
      ;;
    ahead*)
      statusText="cyan"
      ;;
    *)
      statusText="red"
      ;;
  esac
  echo -en $statusText
}

# Print a dot indicating the current git status.
git_dot () {
  local gitCheck="$(git_check)"
  if [[ $gitCheck ]]; then
    local gitStatus="$(git_status)"
    local gitStatusDot='●'
    if [[ $gitStatus == 'staged' ]]; then
      local gitStatusDot='◐'
    elif [[ $gitStatus == 'modified' ]]; then
      local gitStatusDot='○'
    fi
    echo -en "%F{"$(git_status_color)"}$vcs_info_msg_0_ $gitStatusDot%f "
  fi
}

# Get the current directory, truncate it, and make it green
fancy_dir () {
  echo -en "%F{040}%-50<…<%~%<<%f"
  return
}

setopt PROMPT_SUBST
# PROMPT='%F{040}%n%f%{$fg_bold[yellow]%}@%{$fg_no_bold[red]%}${PWD/#$HOME/~}%f%{$fg[magenta]%}${vcs_info_msg_0_}%f %{$fg_bold[yellow]%}$chevrons %{$reset_color%}'

export PS1='$(fancy_dir) $(git_dot)$(seasonal_chevrons) '

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/svitlanadzyuban/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/svitlanadzyuban/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export PATH="/usr/local/share/chruby:$PATH"
