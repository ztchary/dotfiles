local f = io.popen("uname -n")
local conf = require(f:read("*l"))
f:close()

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita-dark")
hl.env("QT_STYLE_OVERRIDE", "Adwaita-Dark")
hl.env("HYPRSHOT_DIR", "~/pics/screenshots")

hl.on("hyprland.start", function ()
	for i = 1, #conf.start do
		hl.exec_cmd(conf.start[i])
	end
end)

hl.monitor({
	output = "",
	mode = "preferred",
	position = "0x0",
	scale = "1"
})

hl.config({
	general = {
		border_size = 0,
		gaps_in = 0,
		gaps_out = 0
	},

	decoration = {
		shadow = {
			enabled = false
		},
		blur = {
			size = 3,
			passes = 3
		}
	},

	animations = {
		enabled = false
	},

	misc = {
		disable_splash_rendering = true,
		disable_hyprland_logo = true,
		background_color = 0
	},

	cursor = {
		hide_on_key_press = conf.hidecursor
	}
})

hl.bind("SUPER + CTRL + ALT + ESCAPE", hl.dsp.exec_cmd("shutdown now"))
hl.bind("SUPER + CTRL + ALT + SHIFT + ESCAPE", hl.dsp.exec_cmd("systemctl reboot --firmware-setup"))
hl.bind("SUPER + ESCAPE", hl.dsp.exit())
hl.bind("SUPER + T", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + O", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi --show=drun"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("iwctl station wlan0 scan"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind("SUPER + h", hl.dsp.focus({ direction = "left"  }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up"    }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down"  }))
hl.bind("SUPER + SHIFT + h", hl.dsp.window.move({ direction = "left"  }))
hl.bind("SUPER + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + k", hl.dsp.window.move({ direction = "up"    }))
hl.bind("SUPER + SHIFT + j", hl.dsp.window.move({ direction = "down"  }))

for i = 1, 10 do
	hl.bind("SUPER + "..(i%10), hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + "..(i%10), hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

