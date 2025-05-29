class_name BetterTooltip extends Control

const tooltip_scene: PackedScene = preload("res://Scenes/UI/better_tooltip.tscn")

func _make_custom_tooltip(for_text) -> Control:
	var tooltip = tooltip_scene.instantiate()
	tooltip.text = for_text
	return tooltip
