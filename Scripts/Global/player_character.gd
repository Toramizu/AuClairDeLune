extends Node

var hp : int = 90
var mp : int = 50
var ap : int = 10

var gold : int = 240

var character : CharacterDefinition

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
	character = Database.characters["Player"]

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
