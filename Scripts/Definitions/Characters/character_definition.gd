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

var max_hp : int :
	get :
		return stats["Con"] * 10
var max_mp : int :
	get :
		return skills["Man"]
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
