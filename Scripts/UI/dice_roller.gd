extends Control

signal dice_rolled()

@export var skill_label : RichTextLabel
@export var roll_label : RichTextLabel
@export var difficulty_label : RichTextLabel
@export var improvement_label : RichTextLabel

@export var success_label : RichTextLabel
@export var failure_label : RichTextLabel
@export var skill_improved_label : RichTextLabel

var roll: int = 0
var to_roll: int
var to_improve: int

var rolling: bool = false
var time: float = 0

func debug_random_roll():
	ask_for_roll("Dan", 20, 0)

func _ready():
	Player.ask_for_roll.connect(ask_for_roll)
	visible = false

func _process(delta):
	if rolling:
		time += delta
		if time > .1:
			roll = randi_range(1, 20)
			roll_label.text = str(roll)
			time = 0

func ask_for_roll(skill_id: String, difficulty: int, improve_roll: int):
	success_label.visible = false
	failure_label.visible = false
	skill_improved_label.visible = false
	visible = true
	rolling = true
	time = 0
	var skill = Database.skills[skill_id]
	var skill_value = Player.get_skill(skill_id)
	skill_label.text = "%s : %d" % [skill.full_name, skill_value]
	roll_label.text = ""
	to_roll = difficulty - skill_value
	difficulty_label.text = "Difficulty %d : %d+" % [difficulty, to_roll]
	to_improve = improve_roll
	var stat = skill.main_stat.full_name
	improvement_label.text = "Skill Up %s : %d+" % [stat, to_improve]
	await dice_rolled
	visible = false
	Player.roll = roll
	Player.roll_complete.emit()

func _on_dice_button_pressed():
	if rolling:
		get_roll()
	else:
		dice_rolled.emit()

func get_roll():
	rolling = false
	print("Diceroll : %d" % roll)
	if roll >= to_roll:
		success_label.visible = true
	else:
		failure_label.visible = true
	if roll >= to_improve:
		skill_improved_label.visible = true
