{
  description = "Terraform \"just-born\" NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations.nixos-proxmox-lxc = import ./machines/proxmox-lxc.nix { inherit pkgs nixpkgs; };
    };
}
