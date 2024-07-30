extends Node2D

@onready var level_info = get_node("/root/GameVars")

###list of nodes for the spycenters
@onready var spy_center_list = [$Camera2D/ConfedMap/spy_centers3, $Camera2D/ConfedMap/spy_centers2, $Camera2D/ConfedMap/spy_centers,
	$Camera2D/ConfedMap/spy_centers4, $Camera2D/ConfedMap/spy_centers5, $Camera2D/ConfedMap/spy_centers6, $Camera2D/ConfedMap/spy_centers7,
	$Camera2D/ConfedMap/spy_centers8, $Camera2D/ConfedMap/spy_centers9, $Camera2D/ConfedMap/spy_centers10, $Camera2D/ConfedMap/spy_centers11]

func _process(delta: float) -> void:
	if level_info.new_turn == true:
		for c in range(len(spy_center_list)):
			if spy_center_list[c].operational == true:
				level_info.op += spy_center_list[c].power_points
		
		$Camera2D/ui_butts/turnbut.clicked = false
		
		level_info.turn += 1
		print(level_info.turn)
		level_info.new_turn = false
