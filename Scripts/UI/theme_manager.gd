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

func _ready():
	TimeManager.time_change.connect(switch_theme)
	switch_theme()

func switch_theme():
	if TimeManager.day_time:
		background.color = Color.BLACK
		theme = night_theme
		main_left_panel.texture = main_left_night
		main_center_panel.texture = main_center_night
		main_right_panel.texture = main_right_night
	else:
		background.color = Color.WHITE
		theme = day_theme
		main_left_panel.texture = main_left_day
		main_center_panel.texture = main_center_day
		main_right_panel.texture = main_right_day
