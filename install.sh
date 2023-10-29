#!/bin/bash
 
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

echo -e "\n${greenColour}[+]${endColour} ${grayColour}Insalling${endColour} ${purpleColour}KL-Sunset${endColour}${grayColour}...${endColour}"
echo -e "\n${redColour}[!]${endColour} ${grayColour}Please be careful. If you are using Parrot OS, change \"apt upgrade -y\" to \"parrot-upgrade\"${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}You shouldn't run this script as root, as it may cause some problems.${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}At some points, you may be prompted for the current user's password to execute certain instructions as root.${endColour}"
echo -e "\n${yellowColour}[*]${endColour}${grayColour} Author: elswix${endColour}"

sleep 5


export CUSER=$(whoami)


if [ $CUSER = "root" ]; then 
  
  echo -e "\n\n${redColour}[!]${endColour} ${grayColour}You can't execute this script as root!${endColour}\n"
  exit 1 
fi

sleep 5

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Checking internet connection...${endColour}"
timeout 2 bash -c 'ping -c 1 google.es' &>/dev/null 

if [ $? != 0 ]; then 
  echo -e "\n\n${redColour}[-]${endColour} ${grayColour}No internet connection${endColour}\n"
  exit 1
fi


clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Starting...${endColour}"
sleep 1

echo -e "${greenColour}[+]${endColour} ${grayColour}Upgrading all packages${endColour}"
sudo apt update && sudo apt upgrade -y

export CUSER=$(whoami)

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Creating backups in /tmp/.backupConfig...${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /opt to /tmp/.backupConfig/opt${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /home/$CUSER/.config to /tmp/.backupConfig/$CUSER/.config${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /root/.config to /tmp/.backupConfig/root/.config${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /home/$CUSER/.zshrc to /tmp/.backupConfig/$CUSER/.zshrc${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /root/.zshrc to /tmp/.backupConfig/root/.zshrc${endColour}"

mkdir /tmp/.backupConfig
mkdir /tmp/.backupConfig/$CUSER 
mkdir /tmp/.backupConfig/root
sudo cp -r /opt /tmp/.backupConfig/opt 
cp -r /home/$CUSER/.config /tmp/.backupConfig/$CUSER/.config 
sudo cp -r /root/.config /tmp/.backupConfig/root/.config 
cp /home/$CUSER/.zshrc /tmp/.backupConfig/$CUSER/.zshrc 
sudo cp /root/.zshrc /tmp/.backupConfig/root/.zshrc 


sudo chown $USER:$USER -R /opt 

clear 
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing dependencies...${endColour}"

sudo apt-get install -y arandr flameshot arc-theme bat feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo papirus-icon-theme imagemagick firejail burpsuite

sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libasound2-dev libxcb-xtest0-dev libxcb-ewmh-dev autoconf meson

sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev 

sudo apt-get install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libnl-genl-3-dev

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing nerdfonts...${endColour}"


mkdir -p ~/.local/share/fonts/ 
sudo mkdir -p /root/.local/share/fonts/



wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip


unzip Hack.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/

sudo unzip Hack.zip -d /root/.local/share/fonts
sudo unzip RobotoMono.zip -d /root/.local/share/fonts 


fc-cache -fv 


clear 
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing kitty...${endColour}" 

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin 
sudo ln -s -f /home/$CUSER/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo ln -s -f /home/$CUSER/.local/kitty.app/bin/kitten /usr/bin/kitten
pkill kitty 
sudo cp /home/$CUSER/.local/kitty.app/lib/kitty/terminfo/x/xterm-kitty /usr/share/terminfo/x/xterm-kitty

clear 


echo -e "${greenColour}[+]${endColour} ${grayColour}Installing i3...${endColour}"
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..


pip3 install pywal 

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing picom dependencies...${endColour}"

sudo apt update
sudo apt install meson libpcre3-dev libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev


clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing picom...${endColour}"
sudo apt remove picom 
git clone https://github.com/ibhagwan/picom.git 
cd picom/
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd ../ 

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Copying configs...${endColour}"


# Wallpaper
cp .fehbg /home/$CUSER/.fehbg 
mkdir /home/$CUSER/.wpaper 
cp .wpaper/wpaper.jpg /home/$CUSER/.wpaper/wpaper.jpg


# Kitty
cp -r .config/kitty /home/$CUSER/.config/
sudo ln -s -f /home/$CUSER/.config/kitty /root/.config/kitty

# i3
cp -r .config/i3/ /home/$CUSER/.config/ 

# Picom 
cp -r .config/picom/ /home/$CUSER/.config/ 


# Rofi
cp -r .config/rofi/ /home/$CUSER/.config/

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing zsh...${endColour}"
sudo apt install zsh 


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /opt/powerlevel10k

sudo usermod --shell /usr/bin/zsh $CUSER
sudo usermod --shell /usr/bin/zsh root

cp .p10k/.p10k.zsh /home/$USER/.p10k.zsh 
sudo cp .p10k/root.p10k.zsh /root/.p10k.zsh 

echo -e "${greenColour}[+]${endColour} ${grayColour}Installing plugins...${endColour}"
sudo cp -r ./.zshPlugins/zsh-autocomplete /usr/share/
sudo cp -r ./.zshPlugins/zsh-autosuggestions /usr/share/
sudo cp -r ./.zshPlugins/zsh-syntax-highlighting /usr/share/

echo -e "${greenColour}[+]${endColour} ${grayColour}Linking root zshrc to $USER zshrc...${endColour}"
cp .zshrc /home/$CUSER/.zshrc
sudo ln -s -f /home/$CUSER/.zshrc /root/.zshrc 

clear 
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing lsd...${endColour}"
wget 'https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb'
sudo dpkg -i './lsd_0.23.1_amd64.deb'
rm -rf './lsd_0.23.1_amd64.deb'

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Copying i3blocks scripts...${endColour}"
sudo cp .scripts/ethernet_status /usr/share/i3blocks/ethernet_status 
sudo cp .scripts/hackthebox_status /usr/share/i3blocks/hackthebox_status 
sudo cp .scripts/target /usr/share/i3blocks/target 
mkdir /opt/temp 
echo "Disconnected" > /opt/temp/target 

mkdir /opt/bin/ 
cp .scripts/settarget /opt/bin/settarget 
chmod +x /opt/bin/settarget 

clear 

sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing Neovim...${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Removing old versions of Neovim...${endColour}"
sleep 3 
sudo apt remove neovim 

mkdir /opt/nvim
git clone https://github.com/neovim/neovim 
cd neovim/
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/opt/nvim/
sudo make install
cd ../ 

ln -s -f /opt/nvim/bin/nvim /opt/bin/nvim 


echo -e "${greenColour}[+]${endColour} ${grayColour}Installing NVChad for Neovim...${endColour}"
git clone https://github.com/NvChad/NvChad .config/nvim --depth 1  
cp -r ./.config/nvim /home/$CUSER/.config/ 
sudo cp -r ./.config/nvim /root/.config/


clear
echo -e "\n\n${greenColour}[+]${endColour} ${grayColour}Done!${endColour}"
echo -e "\n${redColour}[!]${endColour} ${grayColour}Please reboot the system and select i3 on the login screen.${endColour}"
echo -e "\n${yellowColour}[*]${endColour} ${grayColour}You can open a Terminal using Windows+Return${endColour}"
echo -e "${yellowColour}[*]${endColour} ${grayColour}You can open Rofi using Windows+D${endColour}"
echo -e "${yellowColour}[*]${endColour} ${grayColour}You can open Firefox Browser using Windows+Shift+F"
echo -e "${yellowColour}[*]${endColour} ${grayColour}You can open BurpSuite using Windows+Shift+b (It must be installed)"
echo -e "\n${greenColour}[+]${endColour} ${grayColour}Happy Hacking!${endColour}"



