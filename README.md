# Hampus' Dotfiles

This repository contains my personal dotfiles, managed with `stow`. The configurations are designed to be cross-platform for both macOS and Debian-based Linux.

## Installation

### Debian-based Linux (e.g., Debian, Ubuntu)

1.  **Run the installation script** to install all required packages:
    ```sh
    ./install.sh
    ```

2.  **Stow the desired configurations.** Use the `-t` flag to set the target directory to your home folder (`~`).
    ```sh
    # Example: Stow zsh and tmux configurations
    stow -t ~/ zshrc tmux
    ```

### macOS

1.  **Install dependencies** using Homebrew and the provided `Brewfile`:
    ```sh
    brew bundle
    ```

2.  **Stow the desired configurations.**
    ```sh
    # Example: Stow zsh and tmux configurations
    stow -t ~/ zshrc tmux
    ```

## `stow` Usage

`stow` creates symlinks from the files in this repository to the target directory. The `-t` flag specifies the target directory.

-   **To stow (activate) a configuration:** `stow -t ~ <folder_name>`
-   **To unstow (deactivate) a configuration:** `stow -D -t ~ <folder_name>`
-   **To see what `stow` would do without making changes:** `stow -n -t ~ <folder_name>`
