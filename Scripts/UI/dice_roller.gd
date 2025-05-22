extends Control

signal dice_rolled()

@export var skill_label : RichTextLabel
@export var roll_label : RichTextLabel
@export var difficulty_label : RichTextLabel

var roll = 0
var rolling = false
var time = 0

func debug_random_roll():
	ask_for_roll("Dan", 20)

func _ready():
	Player.ask_for_roll.connect(ask_for_roll)

func _process(delta):
	if rolling:
		time += delta
		if time > .1:
			roll = randi_range(1, 20)
			roll_label.text = str(roll)
			time = 0

func ask_for_roll(skill_id: String, difficulty: int):
	visible = true
	rolling = true
	time = 0
	var skill = Database.skills[skill_id]
	var skill_value = Player.get_skill(skill_id)
	skill_label.text = "%s : %d" % [skill.full_name, skill_value]
	roll_label.text = ""
	difficulty_label.text = "Difficulty : %d\n%d+" % [difficulty, difficulty - skill_value]
	await dice_rolled
	visible = false
	Player.roll = roll
	Player.roll_complete.emit()

func _on_dice_button_pressed():
	if rolling:
		rolling = false
	else:
		dice_rolled.emit()
