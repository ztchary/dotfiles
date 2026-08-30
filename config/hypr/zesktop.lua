hl.bind("SUPER + A", hl.dsp.exec_cmd("wpctl set-default $(wpctl list audio sinks | grep -vE 'hdmi|\\*' | cut -f1)"))
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.exec_cmd("hyprshot -m region -f .immy; immy ~/.immy"))
hl.bind("Pause", hl.dsp.exec_cmd("playerctl play-pause"))

hl.window_rule({
	match = {
		class = "discord"
	},
	workspace = "6 silent"
})

hl.window_rule({
	match = {
		class = "Spotify"
	},
	workspace = "7 silent"
})

hl.window_rule({
	match = {
		class = "steam"
	},
	workspace = "8 silent"
})

return {
	hidecursor = false,
	start = { "hyprpaper", "discord", "spotify-launcher", "steam", "immy ~/pics/elgato.png" }
}

