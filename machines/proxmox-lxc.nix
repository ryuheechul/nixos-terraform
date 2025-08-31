{ pkgs, nixpkgs, ... }:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit pkgs; };
  modules = [
    ../features/nix.nix
    ../features/proxmox-lxc.nix
    # ../features/sshd.nix # it's already enabled via ../features/proxmox-lxc.nix
    ../features/essential-pkgs.nix
  ];
}
