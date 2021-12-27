# ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

# install git
sudo apt-get install git

# clone dotfiles
git clone https://github.com/vinodhmj/dotfiles.git dotfiles
git clone https://github.com/vinodhmj/projects.git projects

# create symbolic links
ln -s dotfiles/.emacs.d/ .emacs.d
ln -s dotfiles/.bash_aliases .bash_aliases
ln -s dotfiles/.bash_profile .bash_profile
ln -s dotfiles/.bashrc_custom .bashrc_custom
ln -s dotfiles/.Xmodmap .Xmodmap

# Install C++ essentials
sudo apt-get install g++

# Install Python essentials
sudo apt-get install pip
# keyboard remap
xmodmap .Xmodmap

# install emacs
sudo apt-get install emacs

# Install Malayalam fonts
sudo apt-get install fonts-smc fonts-samyak-mlym fonts-mlym fonts-lohit-mlym

# install tlp to optimise battery
sudo apt-get install tlp

# install dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd&

# Install extra fonts
sudo apt install fonts-crosextra-carlito fonts-crosextra-caladea

# Install firewall
sudo apt install ufw
sudo ufw enable

#install nikola
python3 -m venv nikola
cd nikola
source bin/activate
bin/python -m pip install -U pip setuptools wheel
bin/python -m pip install -U "Nikola[extras]"

# install xbindkeys
sudo apt-get install xbindkeys
