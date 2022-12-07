_hey there!_, these are my dotfiles for NixOS, and Darwin.

The project structure looks like this.

```
.
├── common
│  ├── themes
│  │  └── gruvbox
│  │     ├── material-dark-hard.nix
│  │     ├── material-dark-medium.nix
│  │     ├── material-dark-soft.nix
│  │     ├── material-light-hard.nix
│  │     ├── material-light-medium.nix
│  │     ├── material-light-soft.nix
│  │     ├── mix-dark-hard.nix
│  │     ├── mix-dark-medium.nix
│  │     ├── mix-dark-soft.nix
│  │     ├── mix-light-hard.nix
│  │     ├── mix-light-medium.nix
│  │     └── mix-light-soft.nix
│  ├── wezterm.lua
│  ├── bat.nix
│  ├── default.nix
│  ├── fish.nix
│  ├── helix.nix
│  ├── kitty.nix
│  ├── starship.nix
│  ├── wezterm.nix
│  └── zellij.nix
├── darwin
│  ├── darwin-application-activation.nix
│  ├── homebrew.nix
│  ├── packages.nix
│  └── skhd.nix
├── nixos
│  ├── default.nix
│  ├── hardware-configuration.nix
│  └── packages.nix
├── configuration.nix
└── darwin-configuration.nix
```
