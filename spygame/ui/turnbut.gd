extends Node2D

@onready var level_info = get_node("/root/GameVars")
@export var size = 340

var change_trig = false
var selected = false
var entered = false
var clicked = false


func _process(delta: float) -> void:
	pass
	#if selected == true and change_trig == false:
		#$TurnButs.frame += 1
		#change_trig = true
		
	#if selected == false and change_trig == true:
		#$TurnButs.frame -= 1
		#change_trig = false

#func _input(event: InputEvent) -> void:
	#if event.is_action_released("left_click") and clicked == false and entered == true:
		#level_info.new_turn = true
		#clicked = true
		#selected = false
		
	#if event.is_action_pressed("left_click") and entered == true:
		#selected = true

		
		
#func _on_area_2d_mouse_entered() -> void:
	#entered = true

#func _on_area_2d_mouse_exited() -> void:
	#entered = false


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	entered = true
	
	if event is InputEventMouseButton and event.pressed or event is InputEventScreenTouch and event.pressed:
		level_info.new_turn = true
		clicked = true
		selected = true
		$TurnButs.frame = 1
		
		
	if event is InputEventMouseButton and not event.pressed or event is InputEventScreenTouch and not event.pressed:
		selected = false
		entered = false
		$TurnButs.frame = 0
		
