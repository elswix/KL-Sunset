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


if [ $EUID = 0 ]; then 
  
  echo -e "\n${redColour}[!]${endColour} ${grayColour}You can't execute this script as root!${endColour}\n"
  exit 1 
fi

echo -e "\n${greenColour}[+]${endColour} ${grayColour}Insalling${endColour} ${purpleColour}KL-Sunset${endColour}${grayColour}...${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}You shouldn't run this script as root, as it may cause some problems.${endColour}"
echo -e "\n${yellowColour}[*]${endColour}${grayColour} Author: elswix${endColour}"


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


clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Creating backups in /tmp/.backupConfig...${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /opt to /home/$USER/backup/opt${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /home/$USER/.config to /home/$USER/backup/$USER/.config${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /root/.config to /home/$USER/backup/root/.config${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /home/$USER/.zshrc to /home/$USER/backup/$USER/.zshrc${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Backing up /root/.zshrc to /home/$USER/backup/root/.zshrc${endColour}"

mkdir /home/$USER/backup
mkdir /home/$USER/backup/$USER 
mkdir /home/$USER/backup/root
sudo cp -r /opt /home/$USER/backup/opt 
cp -r /home/$USER/.config /home/$USER/backup/$USER/.config 
sudo cp -r /root/.config /home/$USER/backup/root/.config 
cp /home/$USER/.zshrc /home/$USER/backup/$USER/.zshrc 
sudo cp /root/.zshrc /home/$USER/backup/root/.zshrc 


sudo chown $USER:$USER -R /opt 

clear 
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing dependencies...${endColour}"

sudo apt install -y arandr flameshot arc-theme bat feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo papirus-icon-theme imagemagick firejail curl wget git

sudo apt install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libasound2-dev libxcb-xtest0-dev libxcb-ewmh-dev autoconf meson

sudo apt install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev 

sudo apt install -y cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libnl-genl-3-dev

sudo apt install -y libpcre3-dev libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev

sudo apt install -y libstartup-notification0-dev libxcb-keysyms1-dev libxkbcommon-dev libxkbcommon-x11-dev libyajl-dev libpango1.0-dev

sudo apt install -y libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev

sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

sudo apt install -y xcb

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
sudo ln -s -f /home/$USER/.local/kitty.app/bin/kitty /usr/bin/kitty
sudo ln -s -f /home/$USER/.local/kitty.app/bin/kitten /usr/bin/kitten
pkill kitty 
sudo cp /home/$USER/.local/kitty.app/lib/kitty/terminfo/x/xterm-kitty /usr/share/terminfo/x/xterm-kitty

clear 


echo -e "${greenColour}[+]${endColour} ${grayColour}Installing i3...${endColour}"
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install
cd ../..


pip3 install pywal 


clear

echo -e "${greenColour}[+]${endColour} ${grayColour}Installing picom...${endColour}"

oldpwd1=$(pwd)
wget https://github.com/yshui/picom/archive/refs/tags/v11.1.zip -O /opt/picom.zip
unzip /opt/picom.zip -d /opt/picom
cd /opt/picom/picom-11.1
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install
cd $oldpwd1

clear

echo -e "${greenColour}[+]${endColour} ${grayColour}Copying configs...${endColour}"


# Wallpaper
cp .fehbg /home/$USER/.fehbg 
mkdir /home/$USER/.wpaper 
cp .wpaper/wpaper.jpg /home/$USER/.wpaper/wpaper.jpg


# Kitty
cp -r .config/kitty /home/$USER/.config/
sudo ln -s -f /home/$USER/.config/kitty /root/.config/kitty

# i3
cp -r .config/i3/ /home/$USER/.config/ 

# Picom 
cp -r .config/picom/ /home/$USER/.config/ 


# Rofi
cp -r .config/rofi/ /home/$USER/.config/

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing zsh...${endColour}"
sudo apt install -y zsh 


git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /opt/powerlevel10k

sudo usermod --shell /usr/bin/zsh $USER
sudo usermod --shell /usr/bin/zsh root

cp .p10k/.p10k.zsh /home/$USER/.p10k.zsh 
sudo cp .p10k/root.p10k.zsh /root/.p10k.zsh 

echo -e "${greenColour}[+]${endColour} ${grayColour}Installing plugins...${endColour}"
sudo cp -r ./.zshPlugins/zsh-autocomplete /usr/share/
sudo cp -r ./.zshPlugins/zsh-autosuggestions /usr/share/
sudo cp -r ./.zshPlugins/zsh-syntax-highlighting /usr/share/

echo -e "${greenColour}[+]${endColour} ${grayColour}Linking root zshrc to $USER zshrc...${endColour}"
cp .zshrc /home/$USER/.zshrc
sudo ln -s -f /home/$USER/.zshrc /root/.zshrc 

clear 
echo -e "${greenColour}[+]${endColour} ${grayColour}Installing lsd...${endColour}"
wget 'https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb'
sudo dpkg -i './lsd_0.23.1_amd64.deb'
rm -rf './lsd_0.23.1_amd64.deb'

clear
echo -e "${greenColour}[+]${endColour} ${grayColour}Copying i3blocks scripts...${endColour}"

interface0=$(ip -br a | awk '{print $1}' | grep -vE 'lo|docker|veth')

sed "s/eth0/$interface0/" .scripts/ethernet_status -i

sudo cp .scripts/ethernet_status /usr/share/i3blocks/ethernet_status 
sudo cp .scripts/hackthebox_status /usr/share/i3blocks/hackthebox_status 
sudo cp .scripts/target /usr/share/i3blocks/target 
mkdir /opt/temp 
echo "Disconnected" > /opt/temp/target 

mkdir /opt/bin/ 
cp .scripts/settarget /opt/bin/settarget 
chmod +x /opt/bin/settarget 

clear 

echo -e "${greenColour}[+]${endColour} ${grayColour}Installing Neovim...${endColour}"
echo -e "${redColour}[!]${endColour} ${grayColour}Removing old versions of Neovim...${endColour}"
sleep 3 
sudo apt remove -y neovim 


wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
mv nvim-linux64 /opt/nvim

ln -s -f /opt/nvim/bin/nvim /opt/bin/nvim 


echo -e "${greenColour}[+]${endColour} ${grayColour}Installing NVChad for Neovim...${endColour}"
echo -e "${greenColour}[+]${endColour} ${grayColour}More information about its installation:${endColour}"
echo -e "${yellowColour}[*]${endColour} ${purpleColour}https://nvchad.com/docs/quickstart/install/${endColour}"


rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
sudo rm -rf /root/.config/nvim
sudo rm -rf /root/.local/share/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim
sudo git clone https://github.com/NvChad/starter /root/.config/nvim



clear
echo -e "\n\n${greenColour}[+]${endColour} ${grayColour}Done!${endColour}"
echo -e "\n${redColour}[!]${endColour} ${grayColour}Please reboot the system and select i3 on the login screen.${endColour}"
echo -e "\n${yellowColour}[*]${endColour} ${grayColour}You can open a Terminal using Windows+Return${endColour}"
echo -e "${yellowColour}[*]${endColour} ${grayColour}You can open Rofi using Windows+D${endColour}"
echo -e "${yellowColour}[*]${endColour} ${grayColour}You can open Firefox Browser using Windows+Shift+F"
echo -e "${yellowColour}[*]${endColour} ${grayColour}You can open BurpSuite using Windows+Shift+b (It must be installed)"
echo -e "\n${greenColour}[+]${endColour} ${grayColour}Happy Hacking!${endColour}"



