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
