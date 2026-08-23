--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = "org.qutebrowser.qutebrowser" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
	workspace = "6",
	match = {class = "^(steam_app_default)$"},
})

-- Supposed to avoid idling of full screen games
hl.window_rule({
	match = {
	    class = "^(steam_app_default)$", 
            fullscreen = true,  
    },
        idle_inhibit = "fullscreen",
})



local acer = "DP-5"
local virtual = "VIRTUAL-1"

hl.workspace_rule({ workspace = "1", monitor = acer, default=true})
hl.workspace_rule({ workspace = "2", monitor = acer})
hl.workspace_rule({ workspace = "3", monitor = acer})
hl.workspace_rule({ workspace = "4", monitor = acer})
hl.workspace_rule({ workspace = "5", monitor = acer})

hl.workspace_rule({ workspace = "6", monitor = virtual, default=true})
hl.workspace_rule({ workspace = "7", monitor = virtual})
hl.workspace_rule({ workspace = "8", monitor = virtual})
hl.workspace_rule({ workspace = "9", monitor = virtual})
hl.workspace_rule({ workspace = "10", monitor = virtual})

