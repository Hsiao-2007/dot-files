# These are my dot files for my desktop and laptop

### Special instructions: 

#### Network Share:
1. Install `cifutils` 
2. Create a files to store the credentials to the server to read only for yourself
```bash
touch .creds

# use echo -e "username=...\npassword=..." > .creds or write
# username=...
# password=...
# in the file

chmod 400 .creds # Make it read only for you
```
3. Create a directory called `smb` in `/mnt` 
4. Edit `/etc/fstab` to automatically mount the network share
```
# Network Share
//10.0.0.220/smb    /mnt/smb    cifs        credentials=$XDG_HOME/.creds,_netdev,x-systemd.automount 0 0
```
5. Run `sudo mount -a` to test the automount 

#### Shell:
1. Install zsh
2. Set default shell
```bash
sudo chsh -s /bin/zsh
```
3. Install oh-my-zsh:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. Install Powerlevel10k (shell prompt):
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```
5. Install fast syntax highlighting
```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```
6. Install zsh-autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```
7. Copy `.zshrc`, `.p10k.zsh`, and the `.oh-my-zsh/` directory to the home folder


#### Spicetify:
1. Go to the marketplace in spicetify, settings icon, backup settings, and then import the `spicetify.json` file

#### Extra:
1. Install bat, eza, delta, fzf, ttf-jetbrains-mono-nerd (yay)
