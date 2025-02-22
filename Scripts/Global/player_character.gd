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
	if character.stats.has(stat):
		return character.stats[stat]
	else:
		return 0

func get_stat_mod(stat: String) -> int:
	return get_stat(stat) - 10

func get_skill(skill: String) -> int:
	if character.skills.has(skill) and character.skills[skill] > 0:
		var skl = Database.skills[skill]
		var val = character.skills[skill]
		for stat in skl.type.major_stats:
			val += get_stat_mod(stat.id)
		for stat in skl.type.minor_stats:
			@warning_ignore("integer_division")
			val += get_stat_mod(stat.id) / 2
		return val
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
