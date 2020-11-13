# MPV's dotfiles

## Usage:

### On a new computer:

1. Configure MacOS specific settings:

    ```shell
    ./fresh-mac/macos.sh
    ```

2. Install software:

    ```shell
    ./Brewfile-install.sh
    ```

3. Symlink configuration files:

    ```shell
    ./fresh-mac/symlink.sh
    ```

4. Install tools that require multiple and/or specific versions, using ASDF:

    ```shell
    ./fresh-mac/asdf.py
    ```

### Daily / recurring usage:

* Upgrade installed tools:

    ```shell
    ./Brewfile-install.sh
    ```

* Add newly (manually) installed tools to version control:

    ```shell
    ./Brewfile-dump.sh
    ```

## TODOs

- [X] Try out [Brew Bundle](https://github.com/Homebrew/homebrew-bundle) and [Brewfile](https://github.com/joshukraine/dotfiles/blob/master/Brewfile)
- [ ] Add iTerm2 default profile
- [ ] Try out [strap](https://github.com/MikeMcQuaid/strap) for running this
- [ ] Re-consider [Mackup](https://github.com/lra/mackup) for wider support for application preferences (too)
- [ ] Add Visual Studio Code config/extensions


## Inspiration

- [https://dotfiles.github.io/](https://dotfiles.github.io/)
- [https://github.com/mathiasbynens/dotfiles/](https://github.com/mathiasbynens/dotfiles/)
- [https://github.com/joshukraine/dotfiles](https://github.com/joshukraine/dotfiles)
