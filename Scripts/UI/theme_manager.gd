extends Control

const day_theme = preload("res://Themes/day_theme.res")
const night_theme = preload("res://Themes/night_theme.res")

const main_left_day = preload("res://Assets/UI/Frames/Day/Double_Main_Left.png")
const main_center_day = preload("res://Assets/UI/Frames/Day/Double_Main_Center.png")
const main_right_day = preload("res://Assets/UI/Frames/Day/Double_Main_Right.png")
const main_left_night = preload("res://Assets/UI/Frames/Night/Double_Main_Left.png")
const main_center_night = preload("res://Assets/UI/Frames/Night/Double_Main_Center.png")
const main_right_night = preload("res://Assets/UI/Frames/Night/Double_Main_Right.png")

@export var background : ColorRect

@export var main_left_panel : NinePatchRect
@export var main_center_panel : NinePatchRect
@export var main_right_panel : NinePatchRect

@export var day_color : Color
@export var full_moon_color : Color
@export var thrid_quarter_moon_color : Color
@export var half_moon_color : Color
@export var first_quarter_moon_color : Color
@export var new_moon_color : Color

func _ready():
	TimeManager.time_change.connect(switch_theme)
	switch_theme()

func switch_theme():
	if TimeManager.day_time:
		if TimeManager.moon_phase == 0:
			background.color = full_moon_color
		elif TimeManager.moon_phase == 1 or  TimeManager.moon_phase == 7:
			background.color = thrid_quarter_moon_color
		elif TimeManager.moon_phase == 2 or  TimeManager.moon_phase == 6:
			background.color = half_moon_color
		elif TimeManager.moon_phase == 3 or  TimeManager.moon_phase == 5:
			background.color = first_quarter_moon_color
		else:
			background.color = new_moon_color
		theme = night_theme
		main_left_panel.texture = main_left_night
		main_center_panel.texture = main_center_night
		main_right_panel.texture = main_right_night
	else:
		background.color = day_color
		theme = day_theme
		main_left_panel.texture = main_left_day
		main_center_panel.texture = main_center_day
		main_right_panel.texture = main_right_day
