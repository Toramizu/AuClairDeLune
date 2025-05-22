class_name SubLocationDefinition extends Resource

@export var id : String
@export var full_name : String
@export var icon : Texture2D
@export var icon_size : Vector2i = Vector2i(20, 20)
@export var icon_position : Vector2
@export var condition : String
@export var default_event : DialogueResource
@export var default_start : String
@export var cost : int
@export var resource : Player.Resource_Types

var resource_type
