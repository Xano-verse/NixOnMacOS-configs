# NixOnMacOS-configs

On MacOS we'll have 3 programs working together

### nix - the package manager
### home-manager - to manage files in home directory
### nix-darwin - to configure some MacOS system settings (like dock/taskbar, default shell, touch ID, etc)

and just like with NixOS, we'll have 2 directories
### system - system-wide configuration and packages
### home - home-manager for user-wide configuration


The goal of these configs is not to completely declare a MacOS system, have every package or every configuration reproducible, as it would be with my NixOS configs for the most part, but to provide a solid base I can start building on whenever I need to work on a Mac



## Getting started

### Install nix
(need sudo permission)
```
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh
```

### Install nix-darwin
Just like in NixOS we have both /etc/nix and /etc/nixos, here we'll have /etc/nix and /etc/nix-darwin
We will work in nix-darwin
```
sudo mkdir /etc/nix-darwin
cd /etc/nix-darwin
```

(have it pointing to the flake file itself)
```
sudo nix run nix-darwin/nix-darwin-26.05#darwin-rebuild --extra-experimental-features flakes --extra-experimental-features nix-command -- switch --flake ./flake.nix
```

### Clone this repo and put in /etc/nix-darwin

### Ajudst flake.nix
Change the hostname in `darwinConfigurations."<hostname>" = nix-darwin.lib.darwinSystem {`
(get the hostname by running `scutil --get LocalHostName`)
And change the other `specialArgs` accordingly


# Rebuild with
(have it pointing to the directory with the flake, not the flake itself)
```
sudo darwin-rebuild switch --flake /etc/nix-darwin







