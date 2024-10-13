extends Node2D

@onready var level_info = get_node("/root/GameVars")

@export var fra = 0

#to compare to the level info
@export var activated = 0

@export var size = 296

var change_trig = false
var selected = false
var entered = false

func _ready() -> void:
	$TempButs.frame = fra
	

func _process(delta: float) -> void:
	
	if activated == level_info.current_action:
		selected = true
		
	else:
		selected = false
	
	if selected == true and change_trig == false:
		$TempButs.frame += 1
		change_trig = true
		
	if selected == false and change_trig == true:
		$TempButs.frame -= 1
		change_trig = false

func _input(event: InputEvent) -> void:
	pass

#func _on_area_2d_mouse_entered() -> void:
	#entered = true



#func _on_area_2d_mouse_exited() -> void:
	#e#ntered = false


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	entered = true
	if event is InputEventMouseButton and event.pressed or event is InputEventScreenTouch and event.pressed:
		
		level_info.current_action = activated
		
		print("this is inside the button ", entered)
	if event is InputEventMouseButton and not event.pressed or event is InputEventScreenTouch and not event.pressed: # is InputEventMouseButton and not event.pressed or event is InputEventScreenTouch and not event.pressed:
		entered = false
		print("this is inside the button ", entered)
