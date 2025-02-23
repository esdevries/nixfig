{ pkgs, lib, ... }:
{
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
      iconTheme = "Papirus-Dark";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images_dark/3840x2160.png";
    };

    kscreenlocker.appearance.wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images_dark/3840x2160.png";
    panels = [
      {
        location = "top";
        height = 44;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.taskmanager"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];

    kwin.nightLight.enable = true;
    kwin.nightLight.location.latitude = "52.353511";
    kwin.nightLight.location.longitude = "6.658120";

    kwin.virtualDesktops.number = 9;
    kwin.virtualDesktops.rows = 3;

    kwin.nightLight.mode = "location";
    kwin.nightLight.temperature.night = 3200;

    kwin.effects.wobblyWindows.enable = true;
    kwin.effects.translucency.enable = true;
    kwin.effects.windowOpenClose.animation = "fade";

    kwin.titlebarButtons.left = [
      "on-all-desktops"
      "keep-above-windows"
    ];

    shortcuts = lib.mkMerge [
      {
        kwin = {
          "Kill Window" = "Alt+Q";

          "Switch One Desktop to the Right" = "Alt+D";
          "Switch One Desktop to the Left" = "Alt+A";
          "Switch One Desktop Up" = "Alt+W";
          "Switch One Desktop Down" = "Alt+S";

          "Window One Desktop to the Right" = "Alt+Shift+D";
          "Window One Desktop to the Left" = "Alt+Shift+A";
          "Window One Desktop Up" = "Alt+Shift+W";
          "Window One Desktop Down" = "Alt+Shift+S";
        };
      }
    ];
  };
}
