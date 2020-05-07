GNOME="gnome-tweaks gnome-shell-extension-dash-to-panel"
SYSTEM="meld"
VIDEO="mpv"

wget https://releases.hyper.is/download/deb 
sudo dpkg -i deb
sudo apt install -f $GNOME $SYSTEM $VIDEO

ln -s -f -v $PWD/profile.link $HOME/.profile
