# .dotfiles
Contains my dotfiles. 

Install dependencies:
```
sudo apt install tmux npm ripgrep xclip
npm install -g n
# Install nerd font from:
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono
```

To generate the symlinks for all dotfiles:
```
stow .
```

Install TPM
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Source TPM with tmux running
tmux source ~/.tmux.conf
# Then use ctrl + space + I to install TPM plugins
```


To remove the created symlinks:
```
stow -D .
```
