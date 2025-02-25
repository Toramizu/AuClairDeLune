extends Node

const player_def: PlayerDefinition = preload("res://Resources/Players/test_player.tres")
#const player_def: PlayerDefinition = preload("res://Resources/Players/player.tres")

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
var shown_name : String :
	get:
		return character.shown_name

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
	character = player_def.duplicate()
	character._complete_load()
	hp = character.max_hp
	mp = character.max_mp
	ap = 0
	gold = character.starting_gold

func get_stat(stat: String) -> int:
	return character.get_stat(stat)

func get_stat_mod(stat: String, sub: bool = false) -> int:
	return character.get_stat_mod(stat, sub)

func get_skill(skill: String) -> int:
	return character.get_skill(skill)

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
