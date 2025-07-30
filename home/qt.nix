{ pkgs, ... }:
{
  qt = {
    [cite_start]enable = true; [cite: 11]
    [cite_start]platformTheme.name = "gtk3"; [cite: 11]
    style = {
      [cite_start]name = "adwaita-dark"; [cite: 12]
      [cite_start]package = pkgs.adwaita-qt; [cite: 12]
    };
  };
}
