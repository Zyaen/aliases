#exa
alias ls="exa -al --color=always --group-directories-first"
alias la="exa -a --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias l.="exa -a | egrep '^\.'"
#tar
alias tarnow="tar -acf"
alias untar="tar -zxvf"
#iperf3
alias iperfc="iperf3 -c"
alias iperfs="iperf3 -s"
#termbin
alias tb="nc termbin.com 9999"
#bat
alias cat="bat --style header --style rules --style snip --style changes --style header"
#lolcat
alias lol="lolcat -as 90 -F 0.7"
#figlet
[ "command -v figlet" != "" ] && alias figlet="figlet -w $(tput cols)"
#for fun
alias pls="$(command -v sudo)"
sudo() {
  echo -e "\033[0;31mp\033[0;32ml\033[0;34ms\033[0m ask it kindly, instead of giving me orders"
}
alias :q="exit"
#suffix
alias -s {txt,conf,plist}=nvim
alias -s md=marktext
case $OSTYPE in
  darwin*)
    alias finder="open -R"
    alias marktext="open -a /Applications/Mark\ Text.app"
    alias gchrome="open -a /Applications/Google\ Chrome.app"
    alias upd="brew update && brew upgrade"
    alias clean="brew cleanup"
    ;;

  linux-gnu*)
    case $(sed -n 's/^ID=\(.*\)/\1/p' /etc/*release) in
    arch|garuda)
      alias fixyay="pls rm /var/lib/pacman/db.lck"
      alias upd="topgrade && pls updatedb"
      alias paru="paru --bottomup"
      alias clean="pls pacman -Rns (pacman -Qtdq)"
      [ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay="paru"
    ;;
    debian)
      alias upd="pls apt update && pls apt upgrade"
      alias clean="pls apt autoremove"
    ;;
  esac
  ;;
esac
