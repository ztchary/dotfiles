hl.bind("SUPER + A", hl.dsp.exec_cmd("wpctl set-default $(wpctl list audio sinks | grep -vE 'hdmi|\\*' | cut -f1)"))
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.exec_cmd("hyprshot -m region -f .immy; immy ~/.immy"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("~/dev/marker/marker.sh"))
hl.bind("SUPER + mouse_up", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("SUPER + mouse_down", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("SUPER + EQUAL", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("SUPER + MINUS", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("SUPER + BACKSPACE", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("SHIFT + Pause", hl.dsp.exec_cmd("playerctl -p spotify play-pause"))
hl.bind("Pause", hl.dsp.exec_cmd("playerctl -p firefox play-pause"))

hl.window_rule({
	match = { class = "discord" },
	workspace = "6 silent"
})

hl.window_rule({
	match = { class = "Spotify" },
	workspace = "7 silent"
})

hl.window_rule({
	match = { class = "steam" },
	workspace = "8 silent"
})

hl.on("window.open", function(w)
	if w.class ~= "zenity" then return end
	hl.dispatch(hl.dsp.window.close({ window = w }))
end)

hl.monitor({
	output = "",
	mode = "2560x1440@240",
	position = "0x0",
	scale = "1"
})

return {
	hidecursor = false,
	start = { "hyprpaper", "discord", "spotify-launcher", "steam", "immy ~/pics/elgato.png" }
}

