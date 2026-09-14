hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"))

local rot = 0

local function toggle_rotation()
	rot = (rot + 1) % 4
	hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1, transform = rot})
	hl.config({input = {
		touchdevice = { transform = rot },
		tablet = { transform = rot }
	}})
end

hl.bind("SUPER + SHIFT + R", toggle_rotation)

hl.monitor({
	output = "",
	mode = "preferred",
	position = "0x0",
	scale = "1"
})

function hyprgrass()
	hl.config({
		plugin = {
			hyprgrass = {
				sensitivity = 4.0,
				long_press_delay = 400,
				resize_on_border_long_press = true,
				edge_margin = 10
			}
		}
	})
	hl.plugin.hyprgrass.gesture({
		pattern = {kind = "swipe", fingers = 2, direction = "down"},
		action = "close"
	})
	hl.plugin.hyprgrass.gesture({
		pattern = {kind = "swipe", fingers = 2, direction = "horizontal"},
		action = "workspace",
		scale = 4
	})
	hl.plugin.hyprgrass.bind({
		pattern = {kind = "longpress", fingers = 2},
		action = hl.dsp.window.fullscreen({ action = "toggle" })
	})
	hl.plugin.hyprgrass.bind({
		pattern = {kind = "swipe", fingers = 2, direction = "up"},
		action = hl.dsp.exec_cmd("pkill wofi || wofi")
	})
	hl.plugin.hyprgrass.bind({
		pattern = {kind = "longpress", fingers = 3},
		action = toggle_rotation
	})
end

return {
	hidecursor = true,
	start = function()
		hl.exec_cmd("waybar")
		hl.exec_cmd("alacritty")
		hl.exec_cmd("hyprpm reload && hyprctl dispatch hyprgrass")
	end
}

