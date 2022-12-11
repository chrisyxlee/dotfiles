# dotfiles

## Homebrew

1. Install [Homebrew](https://brew.sh/):

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install packages.

   ```sh
   # Set HOMEBREW_BUNDLE_FILE in ~/.bashrc
   brew bundle install
   ```

## `.gitconfig`

```sh
cp .gitconfig ~/.gitconfig
# Edit the name and email
vim ~/.gitconfig
```

