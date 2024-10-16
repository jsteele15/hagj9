extends Node2D


var play_entered = false
var tut_entered = false
var ext_entered = false

@onready var button_list = [$play, $tut, $ext]

func _ready() -> void:
	var cut_but = get_viewport_rect().size[0] /4
	for b in range(len(button_list)):
		button_list[b].position.x = cut_but * (b + 1) 
		button_list[b].position.y = get_viewport_rect().size[1]/2

func _input(event: InputEvent) -> void:
	if event.is_action_released("left_click"):
		if play_entered == true:
			get_tree().change_scene_to_file("res://scenes/war_map.tscn")
		if tut_entered == true:
			get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
		if ext_entered == true:
			get_tree().quit()



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	play_entered = true
	
	
		
	if event is InputEventMouseButton and not event.pressed:
		play_entered = false


func _on_tut_ar_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	tut_entered = true
		
	if event is InputEventMouseButton and not event.pressed:
		tut_entered = false


func _on_ext_ar_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	ext_entered = true
		
	if event is InputEventMouseButton and not event.pressed:
		ext_entered = false
