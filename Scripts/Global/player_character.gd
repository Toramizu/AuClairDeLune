extends Node

const player_def: PlayerDefinition = preload("res://Resources/Players/player.tres")

var hp : int
var mp : int
var ap : int

var gold : int

var character : PlayerDefinition

var first_name : String :
	get:
		return character.first_name
var last_name : String :
	get:
		return character.last_name
var stats : Dictionary :
	get:
		return character.stats
var skills : Dictionary :
	get:
		return character.skills

var max_hp : int :
	get:
		return character.max_hp
var max_mp : int :
	get:
		return character.max_mp
var max_ap : int :
	get:
		return character.max_ap


func _ready():
	character = player_def
	hp = character.max_hp
	mp = character.max_mp
	ap = character.max_ap
	gold = character.starting_gold

func get_stat(stat: String) -> int:
	if character.stats.has(stat):
		return character.stats[stat]
	else:
		return 0

func get_skill(skill: String) -> int:
	if character.skills.has(skill):
		return character.skills[skill]
	else:
		return 0
	

func skill_check(skill: String, target: int) -> bool:
	var val = get_skill(skill)
	if val >= target:
		return true
	elif val + 20 < target:
		return false
	else:
		var rnd = Tools.roll()
		#TODO : Increase Skill
		return val + rnd >= target
