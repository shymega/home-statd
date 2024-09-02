{ pkgs, ... }:
{
  packages = [
    pkgs.pyright
    pkgs.poetry
    pkgs.git
  ];

  languages = {
    nix.enable = true;
    python = {
      enable = true;
      package = pkgs.python312Full;
      poetry = {
        enable = true;
        activate.enable = true;
        install = {
          enable = true;
          allExtras = true;
          compile = true;
          quiet = true;
        };
      };
    };
    shell.enable = true;
  };

  difftastic.enable = true;
  devcontainer.enable = true;

  pre-commit.hooks = {
    shellcheck.enable = true;
    shfmt.enable = true;
    flake8.enable = true;
    actionlint.enable = true;
    nixpkgs-fmt.enable = true;
    black = {
      enable = true;
      settings.flags = "-l 78 -t py312";
    };
    markdownlint.enable = true;
    # statix.enable = true;
  };
}
