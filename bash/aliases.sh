# bash aliases
# included by .bashrc

# the motley crew of ls stuffs
#
# Add color to less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -la'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'
alias grep='grep --color'

# Ubuntu/Debian package management
alias as="apt-cache search"
alias ash="apt-cache show"
alias ai="sudo apt-get install"
alias ar="sudo apt-get remove"
alias aud="sudo apt-get update"
alias aug="sudo apt-get upgrade"
alias auall="sudo apt-get update && sudo apt-get upgrade"
alias installed="sudo dpkg --get-selections | grep"

# RubyGems
alias gemu="sudo gem update"
alias gemi="sudo gem install --no-ri --no-rdoc"
alias gemun="sudo gem uninstall"
alias gemus="sudo gem update --system"
# install or search for a similarly named gem
function geminst() {
  sudo gem install $1 || gem search $1 -r ;
}

# Rails' script/[command] stuff
alias sst='script/server thin'
alias sgen='script/generate'
alias sc='script/console'

# Rails: migrate and clone to test, 'cause autotest needs it NOW
alias do-db='rake db:auto:migrate && rake db:test:clone'

alias rtu='rake test:units'
alias rtf='rake test:functionals'
alias rt='rake test'

alias annotate='annotate --position before --exclude tests,fixtures'

# autotest
alias atf='autotest -f'

alias v='vim'
alias sv='sudo vim'
alias apache='sudo /etc/init.d/apache2'

# show sorted directory sizes for all directories
alias dua='du -ch --max-depth=1'
alias duv='du -sch ./*'
alias duh='du -sch ./.*'

# human df
alias dfh='df -h'

# system monitoring
alias apache_process='ps -ef | grep apache | grep -v grep | wc -l'
alias topcpu='ps aux | sort -n +2 | tail -10'  # top 10 cpu processes
alias topmem='ps aux | sort -n +3 | tail -10'  # top 10 memory processes
alias psg='ps auxf | grep'

# systat - http://perso.orange.fr/sebastien.godard/index.html
alias sar2='sar -u 2 0'
alias sar5='sar -u 5 0'

# show what ports are open locally
alias local_ports='sudo nmap -sT -O localhost'

# my personal default options when using pwsafe
alias pwsf='sudo pwsafe -upE'

# GNU Screen
alias scrails='screen -c ~/.rails.screen'
alias s='screen -X screen'

function find_grep() {
  find $1 -name $2 | xargs egrep -nC3 $3 | less
}

alias mkdir='mkdir -p'

function touch {
  dir=`expr "$1" : '\(.*\/\)'`
  if [ $dir ]
    then
mkdir -p $dir
  fi
  /usr/bin/touch $1
}

# probably not a best practice, but works for a specific project
alias deliver='git push && cap deploy'

# Login to Cornice Admin Servers
alias cornice_admin='ssh -i ~/.ssh/admin-server.pem ubuntu@ec2-204-236-193-46.compute-1.amazonaws.com'
alias cornice_admin_qa='ssh -i ~/.ssh/admin-server.pem ubuntu@ec2-184-73-82-190.compute-1.amazonaws.com'

# Login to Databases
alias sv_dbm1_stg='mysql -u amsrv -h sv_dbm1_stg.socialvibe.com -p SocialVibe_staging'
alias sv_dbm1='mysql -u amsrv -h sv_dbm1.socialvibe.com -p SocialVibe_production'
alias rep_dbm1='mysql -u amsrv -h rep_dbm1.socialvibe.com -p ArchetypeReporting_production'
alias svnet_dbm1='mysql -u amsrv -h svnet_dbm1.socialvibe.com -p socialvibe_network_production'
alias cornice_database_master='mysql -u amsrv -h 184.73.20.231 -p cornice_production'
alias cornice_database_slave_1='mysql -u amsrv -h 174.129.179.62 -p cornice_production'
alias cornice_database_slave_2='mysql -u amsrv -h 184.73.50.150 -p cornice_production'
alias cornice_database_slave_3='mysql -u amsrv -h 204.236.246.188 -p cornice_production'
alias cornice_database_slave_4='mysql -u amsrv -h 174.129.81.206 -p cornice_production'
alias cornice_qa_database_master='mysql -u amsrv -h 184.73.90.159 -p cornice_qa'
