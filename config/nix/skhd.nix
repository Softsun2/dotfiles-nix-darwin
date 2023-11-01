{enable, package}:
{
  enable = enable;
  package = package;
  skhdConfig = ''
    # These are bound to change, I want these to emulate dwm at some point
    # Alt corresponds to option

    # Emacs
    alt - e : open -a ~/.nix-profile/Applications/Emacs.app

    # focus window
    alt - h : yabai -m window --focus west
    alt - j : yabai -m window --focus south
    alt - k : yabai -m window --focus north
    alt - l : yabai -m window --focus east

    # swap managed window
    shift + alt - h : yabai -m window --swap west
    shift + alt - j : yabai -m window --swap south
    shift + alt - k : yabai -m window --swap north
    shift + alt - l : yabai -m window --swap east

    # move managed window
    shift + alt + ctrl - h : yabai -m window --warp west
    shift + alt + ctrl - j : yabai -m window --warp south
    shift + alt + ctrl - k : yabai -m window --warp north
    shift + alt + ctrl - l : yabai -m window --warp east

    # rotate tree
    alt - r : yabai -m space --rotate 90

    # toggle window fullscreen zoom
    alt - f : yabai -m window --toggle zoom-fullscreen

    # toggle padding and gap
    alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

    # float / unfloat window and center on screen
    alt - t : yabai -m window --toggle float;\
              yabai -m window --grid 4:4:1:1:2:2

    # toggle window split type
    shift + alt - e : yabai -m window --toggle split

    # balance size of windows
    shift + alt - 0 : yabai -m space --balance

    # move window
    shift + alt - 1 : yabai -m window --space 1
    shift + alt - 2 : yabai -m window --space 2
    shift + alt - 3 : yabai -m window --space 3
    shift + alt - 4 : yabai -m window --space 4
    shift + alt - 5 : yabai -m window --space 5
    shift + alt - 6 : yabai -m window --space 6
    shift + alt - 7 : yabai -m window --space 7
    shift + alt - 8 : yabai -m window --space 8
    shift + alt - 9 : yabai -m window --space 9

    # fast focus desktop
    cmd - 0 : yabai -m space --focus recent

    # send window to monitor and follow focus
    shift + alt - n : yabai -m window --display next; yabai -m display --focus next
    shift + alt - p : yabai -m window --display previous; yabai -m display --focus previous

    # increase window size
    shift + alt - w : yabai -m window --resize top:0:-20
    shift + alt - d : yabai -m window --resize left:-20:0

    # decrease window size
    shift + alt - s : yabai -m window --resize bottom:0:-20
    shift + alt - a : yabai -m window --resize top:0:20

    # toggle center window on screen in an orientation fit for reading/writing
    alt - space : export CURRENT_SPACE=$(yabai -m query --spaces | jq -r '.[]|select(."has-focus" == true)') ; \
                                 export INDEX=$(echo $CURRENT_SPACE | jq -r '.index') ; \
                                 export DISPLAY=$(echo $CURRENT_SPACE | jq -r '.display') ; \
                                 export PADDING=$(($(yabai -m query --displays --display $DISPLAY | jq -r '.frame.w') / 4)) ; \
                                 if [[ "$(yabai -m config --space $INDEX left_padding)" != $PADDING ]]; then \
                                   { yabai -m config --space $INDEX left_padding $PADDING && \
                                     yabai -m config --space $INDEX right_padding $PADDING } \
                                 else \
                                   { yabai -m config --space $INDEX left_padding 10 &&  \
                                     yabai -m config --space $INDEX right_padding 10  } \
                                 fi
  '';
}
