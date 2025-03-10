{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "trividha";
  home.homeDirectory = "/home/trividha";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brave
    direnv 
    tree
    jq
    bat
    python311
    awscli2
    zellij
    ripgrep
    htop
    btop
    obs-studio
    qbittorrent
    vlc
    nodejs_18
    prettierd 
    docker-compose
    httpie

    # Git
    lazygit
    gitu
    git-extras

    # Android development 
    android-studio
    flutter
    jdk17

    # dev  
    nil
    nixfmt-rfc-style

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/shubhranshu.sanjeev/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true; 

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    plugins = [
      {
        name = "vi-mode";
	src = pkgs.zsh-vi-mode;
      }
    ];
    initExtra = "export PATH=$PATH:$HOME/.pub-cache/bin";
  };

  programs.kitty = {
    enable = true;
    extraConfig = "include ~/.config/kitty/kangawa-dragon.conf";
    settings = {
      font_family = "Iosevka Nerd Font";
      font_size = 15;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      cursor_shape = "block";
      url_color = "#0087bd";
      url_style = "dotted";
      background_opacity = "0.9";
      hide_window_decorations = "yes";
    };
  };


  # Neovim Configuration
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      packer-nvim
    ];
  };
}
