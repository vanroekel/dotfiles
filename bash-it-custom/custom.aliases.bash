#########################################################################################
#						Set Aliases for Ease of Use										#
#########################################################################################
alias ssh='ssh -X'
alias ps2pdf='ps2pdf13 -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 -dCompatibilityLevel=1.3'

ON_UBUNTU=`uname -a | grep "Ubuntu"`

if [ -n "${ON_UBUNTU}" ]; then
    alias module='/home/douglasj/software/sources/modules-3.2.10/modulecmd bash'
fi

#########################################################################################
#					Set Aliases for LANL Computers										#
#########################################################################################
alias sshlob='ssh wtrw -t ssh lo-fe'
alias sshcon='ssh wtrw -t ssh cj-fe'
alias sshmap='ssh wtrw -t ssh mp-fe'
alias sshmus='ssh wtrw -t ssh mu-fe'
alias sshmol='ssh wtrw -t ssh ml-fe'
alias sshgpfs='ssh wtrw -t ssh gpfst7-fe'

#########################################################################################
#					Set Aliases for Job Queues	    									#
#########################################################################################
alias myq_msub='showq -u `whoami`'


alias reset_unity='stop unity-panel-service; start unity-panel-service'
