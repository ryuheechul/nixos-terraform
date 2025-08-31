# nixos-terraform

> [!NOTE]
> This is nothing to do with the terraform the tool but the concept terraforming.

A quick and dirty way to make your freshly spun NixOS instance a little more habitable.

## Motivation

Where the heck is `/etc/nixos/configuration.nix` on my freshly spun NixOS LXC container? How can I install anything to make the life easier for this initial phase of trying to do something in here? (especially when `nix-shell -p ponysay` doesn't work immediately!)

> [!TIP]
> Actually `nix-shell -p ponysay` would work if you run `nix-channel --update` first! So now this whole repo is quite useless haha!


## Use Cases
### Proxmox LXC
Right now there is only one example which is an LXC container on Proxmox.

These are what I looked at when I first tried to spin up:
- https://www.jacob-swanson.com/posts/nixos-proxmox-lxc-setup
- https://wiki.nixos.org/wiki/Proxmox_Virtual_Environment#LXC
- https://neal.codes/blog/2024-06-04-nixos-proxmox-lxc/
- [Running NixOS on Proxmox LXC](https://taoofmac.com/space/blog/2024/08/17/1530)
- https://mtlynch.io/notes/nixos-proxmox/
- https://aran.dev/posts/deploying-nixos-on-proxmox/
- https://www.reddit.com/r/NixOS/comments/1aw9k9v/default_username_password_for_nixos_lxc_on_proxmox/

After trial and error (and now in 2025), what I would do are the following:
Choose one from here https://hydra.nixos.org/job/nixos/release-25.05/nixos.proxmoxLXC.x86_64-linux#tabs-status and copy the URL and feed that to a CT template.

And create a container based on that.

> [!IMPORTANT]
> Assuming now you are logged into the new container and the internet is working, run the following command inside the container.

```
nixos-rebuild switch --flake github:ryuheechul/nixos-terraform#nixos-proxmox-lxc
```

This basically will give you a few missing packages that make your life a tad bit easier if you are planning to poke around and run things directly within the shell.

> [!WARNING]
> `nix-shell -p ponysay` doesn't seem to work with flake-based NixOS
>
> (yes I'm new to using nixos with flakes as [I build my "regular" machines without flake](https://github.com/ryuheechul/dotfiles/tree/master/bootstrap/foundation/nixos) as that works better for me)
> You can however now run `nix shell nixpkgs#ponysay` instead
>
> If anyone knows how to use `nix-shell -p ponysay` in flaked NixOS, please let me know to save my muscle memory for the time being!

## Caveats

Also in case it wasn't obvious, keep that in mind that this generation will be overwritten by whatever subsequent build that you do with your own configuration. This "terraforming" just makes it easier to run that just in case your initial build and switch process involves cloning a git repo and running a command from a Makefile.

But I also just learned that you can just do something like `nixos-rebuild switch --flake .#your-machine --target-host user@ssh-host`, which makes this nixos-terraform becomes irrelevant if you already have a buildable nix configuration for a machine ready to go.
