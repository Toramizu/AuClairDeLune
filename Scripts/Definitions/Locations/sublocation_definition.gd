class_name SubLocationDefinition extends Resource

enum LocationTypes {
	Sleep,
	Work,
}

@export var id : String
@export var full_name : String
@export var location_type: Array[LocationTypes]
@export var icon : Texture2D
@export var icon_size : Vector2i = Vector2i(20, 20)
@export var icon_position : Vector2
@export var condition : String
@export var default_event : DialogueResource
@export var default_start : String

var resource_type
