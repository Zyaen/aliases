# ZSH-aliases
 my personal aliases, packaged as zsh plugin
## Installation
### Oh My Zsh

1. Clone the repository:
    ```zsh
    git clone git@github.com:zyaen/aliases.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/custom/plugins/aliases
    ```
2. Add `aliases` into `plugins` in the file `~/.zshrc`.
    ```zsh
    sed -ie 's/plugins=(/plugins=(aliases /g' ~/.zshrc
    ```
