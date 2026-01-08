{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = false;
    enableFishIntegration = false;

    settings = {
      # Use a simple format: directory followed by the character module
      format = "$directory$character";

      directory = {
        # Shows the full path (e.g., ~/nixos/modules)
        style = "bold blue";
        truncation_length = 0;
        truncate_to_repo = false;
      };

      character = {
        success_symbol = "[> ](bold green)";
        error_symbol = "[> ](bold red)";
      };

      line_break.disabled = true;
      package.disabled = true;
      git_branch.disabled = true;
      git_status.disabled = true;
      nix_shell.disabled = true;
    };
  };
}
