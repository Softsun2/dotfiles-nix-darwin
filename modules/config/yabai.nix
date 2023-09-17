{enable, package}:
{
  enable = enable;
  package = package;

  enableScriptingAddition = true;

  config = {
    # https://github.com/koekeishiya/yabai/blob/master/doc/yabai.asciidoc#config

    # global settings
    mouse_follows_focus = "off";
    focus_follows_mouse = "off";
    window_origin_display = "default";
    window_placement = "second_child";
    window_topmost = "on";
    window_shadow  = "on";
    window_opacity = "off";
    window_opacity_duration = 0.0;
    active_window_opacity = 1.0;
    normal_window_opacity = 1.0;

    split_ratio = 0.50;
    auto_balance = "off";
    mouse_modifier = "fn";
    mouse_action1 = "move";
    mouse_action2 = "resize";
    mouse_drop_action = "swap";

    # space settings
    layout = "bsp";
    top_padding = 15;
    bottom_padding = 15;
    left_padding = 15;
    right_padding = 15;
    window_gap = 15;

  };

  extraConfig = ''
    # configure user to run yabai as root w/o password: https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)#configure-scripting-addition
    # reload scripting additions on dock restart
    yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

    # re-disable window-shadow on dock restart
    # yabai -m signal --add event=dock_did_restart action="sleep 1 && yabai -m config window_shadow off"


    # enable debug output
    yabai -m config debug_output on

    yabai -m rule --add app="^System Preferences$" manage=off
    yabai -m rule --add app="^zoom.us$" manage=off
    yabai -m rule --add app="^Steam Helper$" manage=off
  '';

}
