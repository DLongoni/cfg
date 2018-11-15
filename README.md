### desktop version

# cfg
configuration dotfiles

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# install fontawesome 
get release from https://github.com/FortAwesome/Font-Awesome
extract, put .ttf files (3 atm: fa-brands, fa-regular, fa-solid) in $HOME/.fonts
sudo apt-get install fonts-font-awesome

# zsh, i3
sudo add-apt-repository ppa:jasonpleau/rofi
sudo apt-get update
sudo apt-get install gnome-icon-theme-full
sudo apt-get install zsh i3 i3status i3blocks rofi thunar feh compton
sudo apt-get install python-dev
sudo pip install pyyaml
sudo pip install psutil

## arc theme
sudo apt-get install lxappearence 
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list"
wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
sudo apt-key add - < Release.key
sudo apt-get update && sudo apt-get install arc-theme
then use lxappearence

# ohmyzsh
## dependencies
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# termite
sudo apt install -y g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf build-essential

## vte-ng
git clone https://github.com/thestinger/vte-ng.git
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install 
cd ..

## termite itself
git clone --recursive https://github.com/thestinger/termite.git
cd termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
sudo update-alternatives --config x-terminal-emulator   

if termite does not show up then do
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 0 

# clone this repo
git clone --bare https://github.com/DLongoni/cfg $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule update --init
config config --local status.showUntrackedFiles no

# misc
sudo apt-get install firefox vlc cmus virtualbox curl virtualenv python3-pip
sudo apt-get install mpd ncmpcpp mpc

sudo pip3 instal virtualenvwrapper

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable

sudo apt-get install arandr 

# picard
naming
$firstalphachar(%albumartistsort%,#)/$replace($if2(%albumartistsort%,%artistsort%),&,and)
/$left(%date%,4) - %album%/$num(%tracknumber%,2) - %title%
2

# qtractor
install kxstudio repo from
http://kxstudio.linuxaudio.org/Repositories

sudo apt-get install guitarix  

qtractor qjackctl kxstudio-extensions qmidinet calf-plugins hexter zam-plugins drumkv1-lv2 synthv1-lv2 samplv1-lv2 lilv-utils guitarix artyfx swh-plugins fluid-soundfont-gm fluid-soundfont-gs zynaddsubfx helm audacious audacity vmpk radium-compressor pizmidi-plugins oxefmsynth argotlunar yoshimi qmidiarp drumgizmo

# nas
sudo apt-get install nfs-common
sudo apt-get install guitarix cadence
192.168.1.110:/volume1/archive /media/davide/SYNOLOGY/Archive nfs rw,intr,soft,user=davide,async,x-systemd.requires=NetworkManager.service 0 0 

