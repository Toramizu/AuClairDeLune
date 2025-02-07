@tool
extends DialogicLayoutBase

@export var canvas_layer: int = 1
@export var follow_viewport: bool = false


func _apply_export_overrides() -> void:
	# apply layer
	set(&'layer', canvas_layer)
	set(&'follow_viewport_enabled', follow_viewport)
