# shell-config

Repo for sharing various shell configurations I use. 

## Zsh

Use the `.zshrc` file, requires oh-my-zsh by robby russel. 

- To get started, install Zsh first: https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH
- Then install Oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh

Then you can clone this repo to some location and symlink the `.zshrc` file to your home folder.

```
> git clone https://github.com/michaelconnor00/shell-config.git <repo_path>/shell-config
> mv $HOME/.zshrc $HOME/.zshrc-template
> ln -s <repo_path>/shell-config/.zshrc $HOME/.zshrc
```

If you want to push your changes so you can use it on other machines, fork this repo first. 

## Prompts

Any Prompt can be used. I currently use [Spaceship Prompt](https://denysdovhan.com/spaceship-prompt/) 

Another suggestion is Pure Prompt (https://github.com/sindresorhus/pure). This needs to be install for the shell to load correctly.

