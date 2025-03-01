class_name DayNightNinePatchRect extends NinePatchRect

const day_texture = preload("res://Assets/UI/Frames/Day/Thin_Label.png")
const night_texture = preload("res://Assets/UI/Frames/Night/Thin_Label.png")

func _ready():
	TimeManager.time_change.connect(switch_theme)
	switch_theme()

func switch_theme():
	if TimeManager.day_time:
		texture = night_texture
	else:
		texture = day_texture
