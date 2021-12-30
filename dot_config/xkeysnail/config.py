# -*- coding: utf-8 -*-

from xkeysnail.transform import *

# [Global modemap] Change modifier keys as in xmodmap
define_modmap(
    {
        Key.CAPSLOCK: Key.LEFT_CTRL,
    }
)

# Emacs-like keybindings in non-Emacs applications
define_keymap(
    lambda wm_class: wm_class
    not in (
        "Emacs",
        "Zathura",
    ),
    {
        K("C-Shift-dot"): K("C-TAB"),
        K("C-Shift-comma"): K("C-Shift-TAB"),
        K("C-b"): K("left"),
        K("C-M-b"): K("C-b"),
        K("C-f"): K("right"),
        K("C-left_brace"): K("esc"),
        K("C-M-f"): K("C-f"),
        K("C-p"): K("up"),
        K("C-n"): K("down"),
        K("C-h"): K("backspace"),
        K("M-b"): K("C-left"),
        K("M-f"): K("C-right"),
        K("M-Shift-f"): K("M-f"),
        K("C-a"): K("home"),
        K("C-e"): K("end"),
        K("C-M-a"): K("C-a"),
        K("C-M-e"): K("C-e"),
        K("C-m"): K("enter"),
        K("C-M-m"): K("C-m"),
        K("C-Shift-m"): K("Shift-enter"),
        K("C-w"): K("C-backspace"),
        K("C-M-w"): K("C-w"),
        K("C-d"): K("delete"),
        K("C-M-d"): K("C-d"),
        K("M-d"): K("C-delete"),
        K("C-k"): [K("Shift-end"), K("backspace")],
        K("C-Super-k"): K("C-k"),
        K("C-Super-a"): K("C-a"),
    },
    "Emacs-like keys",
)
