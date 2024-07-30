extends Node2D

@onready var level_info = get_node("/root/GameVars")

##this is to show whether station is opperational
var operational = false
var change_trig = true

##ton see if the mouse is over the station
var entered = false
var power_points = 10

func _process(delta: float) -> void:
	
	if operational == false:
		$SpyCenter.modulate = "ffffff"
		$".".scale = Vector2(0.6, 0.6)
	if operational == true:
		$SpyCenter.modulate = "4b6691"
		if $".".scale.x < 1:
			$".".scale.x += 0.1
			$".".scale.y += 0.1

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click") and entered == true:
		operational = true

func _on_area_2d_mouse_entered() -> void:
	entered = true

func _on_area_2d_mouse_exited() -> void:
	entered = false
