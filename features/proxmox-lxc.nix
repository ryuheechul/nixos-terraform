{ modulesPath, ... }:

# based on learnings from these:
# - https://www.jacob-swanson.com/posts/nixos-proxmox-lxc-setup
# - https://wiki.nixos.org/wiki/Proxmox_Virtual_Environment#LXC
# - https://neal.codes/blog/2024-06-04-nixos-proxmox-lxc/
# - https://taoofmac.com/space/blog/2024/08/17/1530
# - https://mtlynch.io/notes/nixos-proxmox/
# - https://aran.dev/posts/deploying-nixos-on-proxmox/

{
  imports = [
    # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/virtualisation/proxmox-lxc.nix
    "${modulesPath}/virtualisation/proxmox-lxc.nix"
  ];
}
