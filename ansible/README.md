# Ansible System Setup Playbook

This Ansible playbook automates the setup of a Linux system with SSH keys, Git configuration, Nix package manager, Home Manager, and various tools and configurations. It is designed to work on both **Arch-based systems** (e.g., Arch Linux, EndeavourOS) and **Ubuntu**.

## Features

- **SSH Key Generation**: Generates an ed25519 SSH key at `~/.ssh/id_ed25519`.
- **Git Configuration**: Sets global Git user as "Wentao He" with email "goodmorning_hwt@sjtu.edu.cn".
- **Nix Package Manager**: Installs Nix in single-user mode.
- **Home Manager**: Installs Home Manager with `nix-command` and `flakes` enabled.
- **Software Installation**:
  - `clash-nyanpasu`: A Clash client for proxy management.
  - `mamba`: A fast package manager via Miniforge.
  - `vim`: Installs Vim and sets it as the default text editor.
  - Fcitx5 input method packages (e.g., `fcitx5-mozc`, `fcitx5-rime`) with Rime configuration.
- **Git Repositories**: Clones specified repositories:
  - `git@github.com:goodmorning-hwt/NixOSConfig.git` to `~/.dotfiles`
  - `git@github.com:goodmorning-hwt/.spacemacs.d.git` to `~/.spacemacs.d`
  - `https://github.com/syl20bnr/spacemacs` to `~/.emacs.d`
- **Rime Configuration**: Clones `rime-ice` (Foggy Pinyin) to `~/.local/share/fcitx5/rime`.

## Supported Systems

- **Arch Linux** and derivatives (e.g., EndeavourOS): Uses `pacman` and AUR.
- **Ubuntu**: Uses `apt`.

## Prerequisites

- **Ansible**: Installed on the target system.
  - Ubuntu: `sudo apt install ansible`
  - Arch/EndeavourOS: `sudo pacman -S ansible`
- **AUR Helper** (for Arch-based systems): Required for installing `clash-nyanpasu-bin`.
  - Install `yay` or `paru` (e.g., `pacman -S yay`).
- **Internet Connection**: Required for downloading packages and cloning repositories.

## Usage

1. **Clone or Save the Playbook**  
   Save the playbook as `setup.yml`.

2. **Run the Playbook**  
   Execute the following command in the terminal:
   ```bash
   ansible-playbook setup.yml -K
   ```
   - `-K` prompts for the sudo password, as some tasks require root privileges.

3. **Debugging (Optional)**  
   Add verbosity for troubleshooting:
   ```bash
   ansible-playbook setup.yml -K -vvv
   ```

## Notes

- **Home Manager**: This playbook installs Home Manager via channels. For full flake support, manually configure `flake.nix` in `~/.dotfiles` and run `home-manager switch --flake .`.
- **clash-nyanpasu**: The `.deb` URL for Ubuntu may change; check [clash-nyanpasu releases](https://github.com/libnyanpasu/clash-nyanpasu/releases) for updates.
- **Fcitx5**: Qt packages differ (`fcitx5-qt` for Ubuntu, `fcitx5-qt5` for Arch); adjust if using a different desktop environment.
- **Vim**: Set as the default editor via `update-alternatives` (Ubuntu) or `EDITOR` environment variable (Arch).

## Customization

- Modify `git_repos` in the `vars` section to clone different repositories.
- Adjust `fcitx5_packages` to include additional input method packages.
- Add more tasks under `tasks` for further system customization.
