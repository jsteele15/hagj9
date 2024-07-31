extends Sprite2D

@export var con_1 = Node2D
@export var con_2 = Node2D
@export var rd = Sprite2D

@onready var connected = [con_1, con_2]

var rn = "road"

func _process(delta: float) -> void:
	
	if connected[0].operational == true and connected[1].operational == true:
		rd.modulate = "4b6691"
		
	else:
		rd.modulate = "ffffff"
		

