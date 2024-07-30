extends Node2D

@onready var level_info = get_node("/root/GameVars")

###list of nodes for the spycenters
@onready var spy_center_list = [$Camera2D/ConfedMap/spy_centers3, $Camera2D/ConfedMap/spy_centers2, $Camera2D/ConfedMap/spy_centers,
	$Camera2D/ConfedMap/spy_centers4, $Camera2D/ConfedMap/spy_centers5, $Camera2D/ConfedMap/spy_centers6, $Camera2D/ConfedMap/spy_centers7,
	$Camera2D/ConfedMap/spy_centers8, $Camera2D/ConfedMap/spy_centers9, $Camera2D/ConfedMap/spy_centers10, $Camera2D/ConfedMap/spy_centers11]

var count_num_active = 0

###to pre load the intel 
var intel_load = preload("res://scenes/intel.tscn")

func _process(delta: float) -> void:
	if level_info.new_turn == true:
		
		##this counts how mant active sights there are
		count_num_active = 0
		
		for c in range(len(spy_center_list)):
			if spy_center_list[c].operational == true:
				count_num_active += 1
		
		###this increases your power depending on if theyre active
		for c in range(len(spy_center_list)):
			if spy_center_list[c].operational == true:
				level_info.op += spy_center_list[c].power_points
				
				##this adds alertness to spy centers
				##the idea is that when the alertness gets to 32 it destroys the place
				if spy_center_list[c].alertness < 32:
					
					###this works out if we're activlly reconing
					if spy_center_list[c].reconing == true:
						spy_center_list[c].alertness += 3.2
						
						if spy_center_list[c].recon_lv < 32:
							spy_center_list[c].recon_lv += 6.4
							
						if spy_center_list[c].recon_lv == 32:
							spy_center_list[c].recon_lv = 0
							var intel_inst = intel_load.instantiate()
							intel_inst.position = spy_center_list[c].position
							spy_center_list[c].reconing = false
							$Camera2D/ConfedMap.add_child(intel_inst)
						
					if spy_center_list[c].reconing == false:
						#this times it by the number of sights that are active
						spy_center_list[c].alertness += (0.32 * count_num_active)
				else:
					spy_center_list[c].operational = false
					###this sends out a burst of awareness for all centers that are active
					for s in range(len(spy_center_list)):
						if spy_center_list[s].operational == true:
							spy_center_list[s].alertness += 3.2
			
			##this reduces the alertness if the center is deactivated
			if spy_center_list[c].operational == false:
				if spy_center_list[c].alertness > 0:
					###need to change this so i can change the values dynamically and not run over
					spy_center_list[c].alertness -= 3.2
		
		$Camera2D/ui_butts/turnbut.clicked = false
		
		###this is for the tracking stats
		$Camera2D/game_stats/battle.text = "[center] battle in {howl} turns[/center]".format({"howl":level_info.battle_list[level_info.battle_ind][1]})
		$Camera2D/game_stats/year.text = "[center] {year} [/center]".format({"year":level_info.date})
		$Camera2D/game_stats/turn.text = "[center] turn: {t} [/center]".format({"t":level_info.turn})
		
		level_info.turn += 1
		level_info.new_turn = false
		
	#placing this here so it changes dynamically
	$Camera2D/game_stats/op_power.text = "[center] OP: {op} [/center]".format({"op":level_info.op})
	
