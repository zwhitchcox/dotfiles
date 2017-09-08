sudo add-apt-repository ppa:atareao/atareao
sudo apt-get install dconf-cli my-weather-indicator -y
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git ~/solarized
cd ~/solarized
./install.sh --install-dircolors
sudo apt-get install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
cd ~
rm -rf solarized
