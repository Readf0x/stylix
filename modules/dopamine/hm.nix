{ config, lib, ... }: let
  themeFile = config.lib.stylix.colors {
    template = ./template.mustache;
    extension = "json";
  };
in {
  options.stylix.targets.dopamine.enable = config.lib.stylix.mkEnableTarget "dopamine" true;

  config = lib.mkIf (config.stylix.enable && config.stylix.targets.dopamine.enable) {
    xdg.configFile."Dopamine/Themes/Stylix.theme".source = themeFile;
  };
} 
