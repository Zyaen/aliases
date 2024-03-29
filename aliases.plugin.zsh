#env
alias cdalias="cd $ZSH_CUSTOM/plugins/aliases/"
alias aliases="nvim $ZSH_CUSTOM/plugins/aliases/aliases.plugin.zsh"
alias zshrc="nvim $HOME/.zshrc"
#exa
alias ls="exa -al --color=always --group-directories-first"
alias la="exa -a --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias lt="exa -aT --color=always --group-directories-first"
alias l.="exa -a | egrep '^\.'"
alias tree="exa --tree"
#iperf3
alias iperfc="iperf3 -c"
alias iperfs="iperf3 -s"
#adb
alias szk="adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh"
#utils
./() {
  if [ $# -eq 0 ]
    then
      ./$(fzf)
  else
    chmod +x "$@"
    for script in "$@"; do
      ./"$script"
    done
  fi
}
yt2mp3() {
	yt-dlp -f "bestaudio/best" -ciw -o "%(title)s.%(ext)s" -v -x --audio-quality 0 --audio-format mp3 "$@" &> /dev/null &
}
pathappend() {
	echo "export PATH=\$PATH:$@" >> ~/.zshrc
}
pathprepend() {
	echo "export PATH=$@:\$PATH" >> ~/.zshrc
}
setenv() {
  echo "export $@" >> ~/.zshrc
}
#ssh
sshkygn() {
  ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)"
}
sshcpid() {
  if [ "command -v ssh-copy-id" != "" ]; then ssh-copy-id $@
  else
    #wip
  fi
}
#termbin
alias tb="nc termbin.com 9999"
#bat
alias cat="bat --style header --style snip --style changes --style header"
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
ma() {
figlet $@ | lol
}
#suffix
alias -s {txt,conf,plist,yaml,yml,xml,json}=nvim
alias -s md=marktext
alias -s {avi,flv,mkv,mov,mp4,mpg,ts,wmv}=mpv
case $OSTYPE in
  darwin*)
    alias finder="open -R"
    alias marktext="open -a /Applications/Mark\ Text.app"
    alias gchrome="open -a /Applications/Google\ Chrome.app"
    alias upd="brew update && brew upgrade"
    alias clean="brew cleanup"
    ;;

  linux*)
    case $(sed -n 's/^ID=\(.*\)/\1/p' /etc/*release) in
    alpine|\"postmarketos\")
      alias prova="echo prova"
      alias upd="pls apk update && pls apk upgrade -a"
      alias fixapk="sudo apk fix"
    ;;
    arch|garuda)
      alias fixyay="pls rm /var/lib/pacman/db.lck"
      alias upd="topgrade && pls updatedb"
      alias clean="pls pacman -Rns $(pacman -Qtdq)"
      alias yay="paru --bottomup"
    ;;
    debian|ubuntu|pop)
      alias upd="pls apt update && pls apt upgrade -y"
      alias clean="pls apt autoremove"
      alias pihole-up="pihole -up&&pls sed -ie 's/= 80/= 3996/g' /etc/lighttpd/lighttpd.conf&&pls /etc/init.d/lighttpd restart"
      export PATH=~/.local/share/junest/bin:$PATH
      export PATH="$PATH:~/.junest/usr/bin_wrappers"
      alias jn="$(command -v junest) --"
      alias junest="jn fish"
    ;;
  esac
  ;;
esac
find.() {
find . -type f -exec grep -H '$@' {} \;
}
