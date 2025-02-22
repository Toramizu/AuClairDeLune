class_name SkillTypeDefinition extends Resource

@export var id : String
@export var name : String
@export var major_stats_id : Array[String]
@export var minor_stats_id : Array[String]
@export var color : Color

var major_stats : Array[StatDefinition]
var minor_stats : Array[StatDefinition]

func _load_db(stats : Dictionary):
	for stat in major_stats_id:
		major_stats.append(stats[stat])
	for stat in minor_stats_id:
		minor_stats.append(stats[stat])
