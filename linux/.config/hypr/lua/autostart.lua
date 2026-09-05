hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

-- Hardware Acceleration & Drivers (Nvidia + VA-API)
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("WLR_RENDERER", "vulkan")

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "30")

-- Hyprland Renderer Fixes
-- Prevents screen flickering, Wayland buffer errors, and login stalls
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Autostart Daemons and Programs
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user restart xdg-desktop-portal-hyprland")
	hl.exec_cmd("systemctl --user restart xdg-desktop-portal")
	hl.exec_cmd("systemctl --user restart pipewire wireplumber")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("waybar & dunst & hypridle")
	hl.exec_cmd("waypaper --restore")
	-- hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 30")
	-- hl.exec_cmd("~/.config/hypr/scripts/wallpaper_changer.sh")
	hl.exec_cmd("playerctld daemon")
end)
