extends Node2D


var play_entered = false

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		get_tree().change_scene_to_file("res://scenes/war_map.tscn")

func _on_area_2d_mouse_entered() -> void:
	play_entered = true

func _on_area_2d_mouse_exited() -> void:
	play_entered = false
