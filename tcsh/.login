#!/bin/tcsh
#set echo 
#set verbose
if ( `echo $0` == '-tcsh' ) then 
  echo 'loaded tmux and bash shell...'
  module load tmux
  if  ( { tmux  has-session -t $USER } ) then
    if ( ! $?TMUX  )  then
      echo 'attaching to existing tmux session...'
      tmux -2 -u attach-session -t $USER
    endif
  else 
    echo 'new tmux session'
    tmux -2 -u new-session -s $USER
  endif
  # always load bash (in two separate contexts)
  if (  $?TMUX  )  then
    /bin/bash -l 
  endif
endif
