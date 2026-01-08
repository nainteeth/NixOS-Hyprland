{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

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

      line_break.disabled = false;
      package.disabled = false;
      git_branch.disabled = false;
      git_status.disabled = false;
      nix_shell.disabled = false;
    };
  };
}
