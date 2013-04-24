#########################################################################################
#						Set Aliases for Ease of Use										#
#########################################################################################
alias adb-start="adb kill-server && sudo /home/douglasj/AndroidSDK/adt-bundle-linux-x86_64-20130219/sdk/platform-tools/adb start-server"
alias tunhome="ssh -4fgN -D 23000 home"
alias tunhome_ip="ssh -4fgN -D 23000 68.35.11.65"
alias gnuplot="rlwrap -a -c gnuplot"
alias mountiso="sudo mount -o loop -t iso9660"
alias ssh='ssh -X'
alias prepare-wine='echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope'
alias mpas_tcs='svn co https://svn-mpas-model.cgd.ucar.edu/branches/ocean_projects/ocean_test_cases_staging/ocean'
alias module='/home/douglasj/software/sources/modules-3.2.10/modulecmd bash'
alias ps2pdf='ps2pdf13 -dPDFSETTINGS=/prepress -dSubsetFonts=true -dEmbedAllFonts=true -dMaxSubsetPct=100 -dCompatibilityLevel=1.3'

#########################################################################################
#					Set Aliases for LANL Computers										#
#########################################################################################
alias sshlob='ssh wtrw -t ssh lo-fe1'
alias sshcon='ssh wtrw -t ssh cj-fe1'
alias sshmap='ssh wtrw -t ssh mp-fe1'
alias sshmus='ssh wtrw -t ssh mu-fe1'
alias sshmol='ssh wtrw -t ssh ml-fe1'
alias sshgpfs='ssh wtrw -t ssh gpfst7-fe'

