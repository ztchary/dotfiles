hl.bind("SUPER + A", hl.dsp.exec_cmd("wpctl set-default $(wpctl list audio sinks | grep -vE 'hdmi|\\*' | cut -f1)"))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("pkill pw-loopback || pw-loopback -C 'alsa_input.pci-0000_0e_00.6.analog-stereo'"))
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.exec_cmd("hyprshot -m region -f .immy; immy ~/.immy"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("~/dev/marker/marker.sh"))
hl.bind("Pause", hl.dsp.exec_cmd("playerctl play-pause"))

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

return {
	hidecursor = false,
	start = { "hyprpaper", "discord", "spotify-launcher", "steam", "immy ~/pics/elgato.png" }
}

