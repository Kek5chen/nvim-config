# Zsh Config
{ ... }:

{
    config = {
        # Zsh
        programs.zsh.enable = true;
        programs.zsh.shellAliases = {
          "ll" = "ls -l";
          "hswitch" = "home-manager switch";
          "n" = "nvim";
          "c" = "clear";
        };
        programs.zsh.envExtra = "export EDITOR=nvim";

        # DirEnv
        programs.direnv.enable = true;
        programs.direnv.enableZshIntegration = true;
        programs.direnv.nix-direnv.enable = true;

        # Oh-My-Zsh
        programs.zsh.oh-my-zsh.enable = true;
        programs.zsh.oh-my-zsh.plugins = [ "git" ];
    };
}

