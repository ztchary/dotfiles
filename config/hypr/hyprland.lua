hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita-dark")
hl.env("QT_STYLE_OVERRIDE", "Adwaita-Dark")

hl.on("hyprland.start", function ()
	hl.exec_cmd("waybar")
	hl.exec_cmd("alacritty -e bash -c 'systemd-analyze; bash'")
end)

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
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
		hide_on_key_press = true
	}
})

hl.bind("SUPER + CTRL + ALT + ESCAPE", hl.dsp.exec_cmd("shutdown now"))
hl.bind("SUPER + CTRL + ALT + SHIFT + ESCAPE", hl.dsp.exec_cmd("shutdown -r now"))
hl.bind("SUPER + ESCAPE", hl.dsp.exit())
hl.bind("SUPER + T", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind("SUPER + O", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + R", hl.dsp.exec_cmd("wofi --show=drun"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("iwctl station wlan0 scan"))

hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	hl.bind("SUPER + "..(i%10), hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + "..(i%10), hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

