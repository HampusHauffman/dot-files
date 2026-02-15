#!/bin/bash
# Installation script for Debian-based systems

# Update package lists
sudo apt-get update

# Install stow
sudo apt-get install -y stow

# Install packages from Brewfile
sudo apt-get install -y zsh fd-find ripgrep wget tldr bat git gh tmux 

# Packages that need manual installation or are not in apt
# eza: Manual installation required. See https://github.com/eza-community/eza/blob/main/INSTALL.md
# rm-improved: Not available on Debian.
# yazi: Manual installation required. See https://yazi-rs.github.io/docs/installation



