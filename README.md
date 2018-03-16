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

# zsh, i3
sudo apt-get install zsh i3 i3status i3blocks rofi thunar feh

## arc theme
sudo apt-get install lxappearence 
https://github.com/horst3180/Arc-theme
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
sudo update-alternatives --install /usr/bin/ x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 0 

# clone this repo
git clone --bare https://github.com/DLongoni/cfg $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config submodule update --init
config config --local status.showUntrackedFiles no

# misc
sudo apt-get install firefox clementine vlc cmus

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable

sudo apt-get install arandr 


# qtractor
sudo apt-get install guitarix cadence 

qtractor qjackctl kxstudio-extensions qmidinet calf-plugins hexter zam-plugins drumkv1-lv2 synthv1-lv2 samplv1-lv2 lilv-utils guitarix artyfx swh-plugins fluid-soundfont-gm fluid-soundfont-gs zynaddsubfx helm audacious audacity vmpk radium-compressor pizmidi-plugins oxefmsynth argotlunar yoshimi qmidiarp drumgizmo
