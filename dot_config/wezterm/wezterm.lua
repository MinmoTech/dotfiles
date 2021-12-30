return {
  use_ime = true,
  unix_domains = {
    {
      name = "unix",
      -- If true, connect to this unix domain when `wezterm` is started
      connect_automatically = true,

      -- The path to the socket.  If unspecified, a resonable default
      -- value will be computed.

      -- socket_path = "/tmp/wezterm",

      -- If true, do not attempt to start this server if we try and fail to
      -- connect to it.

      -- no_serve_automatically = false,

      -- If true, bypass checking for secure ownership of the
      -- socket_path.  This is not recommended on a multi-user
      -- system, but is useful for example when running the
      -- server inside a WSL container but with the socket
      -- on the host NTFS volume.

      -- skip_permissions_check = false,

    }
  },
  keys = {
   -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
   {key="Backspace", mods="CTRL", action={SendKey={key="w", mods="CTRL"}}},
   {key="Delete", action={SendKey={key="d", mods="CTRL"}}},
   {key="Home", action={SendKey={key="a", mods="CTRL"}}},
   {key="End", action={SendKey={key="e", mods="CTRL"}}},
  }
}
