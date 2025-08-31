# nixos-terraform

> [!NOTE]
> This is nothing to do with the terraform the tool but the concept terraforming.

A quick and dirty way to make your freshly spun NixOS instance little more inhabitable.

## Motivations

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
- https://taoofmac.com/space/blog/2024/08/17/1530
- https://mtlynch.io/notes/nixos-proxmox/
- https://aran.dev/posts/deploying-nixos-on-proxmox/

After trial and error (and now in 2025), what I would do are followings:
Choose one from here https://hydra.nixos.org/job/nixos/release-25.05/nixos.proxmoxLXC.x86_64-linux#tabs-status and copy the URL and feed that to a CT template.

And create a container based on that.

> [!IMPORTANT]
> Assuming now you are logged into the new container and the internet is working, run the following command inside the container.

```
nixos-rebuild switch --flake github:ryuheechul/nixos-terraform#nixos-proxmox-lxc
```

This basically will give you, few missing packages that makes your life tad bit easier if you are planning to do poke around and run things within the shell directly.

## Caveats

Also in case it wasn't obvious, keep that in mind that this generation be overwritten by whatever subsequent build that you do with your own configuration. This "terraforming" just makes it easier to run that just in case you first build and switch process would be like cloning a git repo and run command from a Makefile.

But I also just learned that you can just do something like `nixos-rebuild switch --flake .#your-machine --target-host user@ssh-host`, which makes this nixos-terraform irrelevant if you already have a buildable nix configuration for a machine ready to go.
