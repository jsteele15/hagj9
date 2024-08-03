extends Control

###this will control the layout of the ui on the screen

@onready var button_list = [$upgrade, $close, $recon, $intel, $turnbut]

func _ready() -> void:
	
	$".".position.y = get_viewport_rect().size[1] + 40
	$".".size.x = get_viewport_rect().size[0]
	#works out the size of the map then places the buttons in the relevant areas
	var cut_but = get_viewport_rect().size[0] /7
	for b in range(len(button_list)):
		button_list[b].position.x = cut_but * (b + 1) -20
	
