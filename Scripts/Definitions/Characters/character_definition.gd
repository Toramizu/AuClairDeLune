class_name CharacterDefinition extends Resource

@export var id : String
@export var first_name : String
@export var last_name : String
@export var nickname : String
var shown_name : String :
	get:
		if nickname:
			return nickname
		else:
			return first_name

@export var stats : Dictionary
@export var skills : Dictionary

@export var tags : Array[String]
@export var flags : Dictionary

@export var player_relationships : Array[String]
@export var friendship : float
@export var attraction : float

var max_hp : int :
	get :
		return stats["Str"] + stats["Dex"] + stats["Con"]
var max_mp : int :
	get :
		return stats["Int"] + stats["Wil"] + stats["Cha"]
var max_ap : int :
	get :
		return 100 #+ stats["Wil"]

func _complete_load():
	for stat in Database.stats:
		if not stats.has(stat):
			stats[stat] = 10
	
	for skill in Database.skills:
		if not skills.has(skill):
			skills[skill] = Database.skills[skill].start_value

func get_stat(stat: String) -> int:
	if stats.has(stat):
		return stats[stat]
	else:
		return 0

func get_stat_mod(stat: String, sub: bool = false) -> int:
	if sub:
		@warning_ignore("integer_division")
		return (get_stat(stat) - 10) / 2
	else:
		return get_stat(stat) - 10

func get_skill(skill: String) -> int:
	if skills.has(skill) and skills[skill] > 0:
		var skl = Database.skills[skill]
		var val = skills[skill]
		if skl.main_stat:
			val += get_stat_mod(skl.main_stat.id)
		if skl.sub_stat:
			val += get_stat_mod(skl.sub_stat.id, true)
		return val
	else:
		return 0
