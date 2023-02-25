# dotfile

## ssh setting
### Using openssh & make ssh-key
```sh
mkdir ~/.ssh
ssh-keygen -t rsa
```
### [Add SSH key](https://github.com/settings/ssh)

### Check ssh conecting
```sh
ssh -T git@github.com
```
- Success
`Hi (account名)! You've successfully authenticated, but GitHub does not provide shell access.`

## ghq setting

### add commands

```sh
mkdir ~/src
git config ghq.root "~/src"
git config --global user.email "email"
git config --global user.name "name"

ghq get git@github.com:kirisu25/dotfiles
```

## zsh setting

### add commands
```sh
ln -s =/src/github.com/kirisu25/zsh/.zshrc ~/
```

## vim setting

### add commands
```sh
mkdir ~/.vim
ln -s ~/src/github.com/kirisu25/dotfiles/vim/* ~/.vim/
```

##starship setting

### add commands
```sh
mkdir ~/.config
ln -s ~/src/github.com/kirisu25/dotfiles/starship/starship.toml ~/.config
```

