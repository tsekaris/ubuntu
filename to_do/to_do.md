# suckless software.

## dwn

sudo apt-get install xorg

sudo apt-get install xinit

sudo apt install libx11-dev

sudo apt install libxft-dev

sudo apt install libxinerama-dev

Δημιουργία .xinitrc και προσθήκη: exec dwm

git clone https://git.suckless.org/dwm

Aλλάζω ονομασία dwm σε .dwm

cd .dwm

sudo make clean install

## dmenu

git clone https://git.suckless.org/dmenu

Aλλάζω ονομασία σε .dmenu

cd .dmenu

sudo make clean install

## st

git clone https://git.suckless.org/st

Αλλάζω ονομασία σε .st

cd .st

sudo make clean install

to do:

scroll up and down.


# google-chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

sudo apt-get install -f


# vmware tools

Για maximized screen, mouse κτλ

sudo apt-get install open-vm-tools
sudo apt-get install open-vm-tools-desktop

Για mount shared folder:

sudo vmhgfs-fuse .host:/ ~/host -o allow_other -o uid=1000

Για unmount shared folder:

sudo umount ~/host

# sound

sudo apt-get install pulseaudio pulsemixer

Χρειάζεται reboot

# inkscape

sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt-get install inkscape

# mpv

sudo add-apt-repository ppa:mc3man/mpv-tests -y
sudo apt-get install mpv -y

# sxiv

sudo apt-get install sxiv