extends Control

@onready var label_list = [$op_power, $battle, $year, $turn]

func _ready() -> void:
	
	
	$".".size.x = get_viewport_rect().size[0]
	#works out the size of the map then places the buttons in the relevant areas
	var cut_but = get_viewport_rect().size[0] /4
	for l in range(len(label_list)):
		label_list[l].size.x = get_viewport_rect().size[0]/4
		label_list[l].position.x = cut_but * l
	
