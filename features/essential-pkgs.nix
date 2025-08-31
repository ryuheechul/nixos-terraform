{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    gnumake
  ];
}
