{ config, pkgs, ... }:

{
  services.urxvtd.enable = true;
  environment.systemPackages = with pkgs; [ rxvt-unicode ];
  services.xserver.displayManager.sessionCommands = ''
    xrdb "${pkgs.writeText  "xrdb.conf" ''
      ! URXVT APPEARANCE
      URxvt.font:                       xft:JetBrainsMono Nerd Font Mono:style:Bold:size=9
      URxvt.geometry:                   82x24
      URxvt.internalBorder:             15
      URxvt.cursorBlink:                false
      URxvt.cursorUnderline:            false
      URxvt.saveline:                   32768
      URxvt.scrollBar:                  false
      URxvt.scrollBar_right:            true
      URxvt.scrollBar_floating:         false
      URxvt.scrollstyle:                plain
      URxvt.urgentOnBell:               false
      URxvt.depth:                      24
      URxvt.iso14755:                   false

      ! URXVT EXTENSIONS
      URxvt.clipboard.autocopy:         true
      URxvt.keysym.Shift-Control-V: eval:paste_clipboard
      URxvt.keysym.Shift-Control-C: eval:selection_to_clipboard

      ! COLOR SCHEME
      #define black0                    #373E4D
      #define black1                    #3B4252
      #define black2                    #434C5E
      #define black3                    #4C566A
      #define red0                      #FA5AA4
      #define red1                      #FA74B2
      #define green0                    #2BE491
      #define green1                    #44EB9F
      #define yellow0                   #FA946E
      #define yellow1                   #FAA687
      #define blue0                     #63C5EA
      #define blue1                     #7ACBEA
      #define magenta0                  #CF8EF4
      #define magenta1                  #D8A6F4
      #define cyan0                     #89CCF7
      #define cyan1                     #A1D5F7
      #define white0                    #F9F9F9
      #define white1                    #F7F7F7
      #define white2                    #F4F4F4

      *.foreground:                     white0
      *.background:                     black0
      *.cursorColor:                    white0
      *.color0:                         white1
      *.color1:                         red0
      *.color2:                         green0
      *.color3:                         yellow0
      *.color4:                         blue0
      *.color5:                         magenta0
      *.color6:                         cyan0
      *.color7:                         black2
      *.color8:                         white2
      *.color9:                         red1
      *.color10:                        green1
      *.color11:                        yellow1
      *.color12:                        blue1
      *.color13:                        magenta1
      *.color14:                        cyan1
      *.color15:                        black3
    ''}"
    '';
  }
