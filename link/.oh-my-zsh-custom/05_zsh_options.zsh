## https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/

#############
## Corrections
setopt CORRECT
setopt CORRECT_ALL

#############
## HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
# setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
# setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

SAVEHIST=5000
HISTSIZE=2000
