extends Node2D

@onready var level_info = get_node("/root/GameVars")

###tutorial beats to make sure the player doesnt accidently skip half the tutorial
var tutorial_beats = 0

###save button locations at the begining of the scene
var open_loc;
var spy_loc; 
var save_cur_turn;

###this is to work out what has been triggered tutorial wise
var open_pressed = false
var station_pressed = false
var turn_pressed = false
var battle_pressed = false
var spy_pressed = false
var spying_pressed = false
var turn_2_pressed = false
var turn_3_pressed = false
var north_pressed = false
var counter_pressed = false
var explosion_pressed = false
var turn_4_pressed = false
var turn_5_pressed = false
var turn_6_pressed = false
###this is to change the arrow position
var arrow_pos = Vector2(1618, 204)

###the tutorial wasnt working, so I ripped it all out, put in the war map as a scene
### ill place a bunch of arrows with triggers to guide the player through the first few turns

func _ready() -> void:
	level_info.op = 100
	$tutorial_text.text = "Press the open station button"
	
	###set the position of the speaking guy
	$overlay/TutGuy.global_position = Vector2(280, get_viewport_rect().size[1]-260)
	
	###this is to set all the locations of the arrows
	open_loc = Vector2($war_map/Camera2D/ui_butts/upgrade.global_position[0]-96, $war_map/Camera2D/ui_butts/upgrade.global_position[1])
	spy_loc = Vector2($war_map/Camera2D/ui_butts/recon.global_position[0]-96, $war_map/Camera2D/ui_butts/recon.global_position[1])
	
	arrow_pos = open_loc
	
	#var screen_size = get_viewport_rect().size
	#var map_scale_factor = (screen_size.x / 1920.0)*2
	#$overlay.scale = Vector2(map_scale_factor, map_scale_factor)

func _process(delta: float) -> void:
	$overlay/TutorialArrow.position = arrow_pos
	
	if $war_map/Camera2D/ConfedMap/spy_centers11.operational == true or $war_map/Camera2D/ConfedMap/spy_centers7.operational == true:
		if explosion_pressed == false:
			$tutorial_text.text = " This state has a target you can attack. Attacking the target will give you war score, but cost a large amount of OP. To attack, press the target button then the image. If you have enough OP."
			
			if $tutorial_text.visible == false:
				$tutorial_text.visible = true
				$overlay/TutGuy.visible = true
				
			if $overlay/TutorialArrow.visible == false:
				$overlay/TutorialArrow.visible = true
			
			if $war_map/Camera2D/ConfedMap/spy_centers11.operational == true:
				arrow_pos = Vector2($"war_map/Camera2D/des_con/css albemarle".global_position[0]-64, $"war_map/Camera2D/des_con/css albemarle".global_position[1])
			
			if $war_map/Camera2D/ConfedMap/spy_centers7.operational == true:
				arrow_pos = Vector2($"war_map/Camera2D/des_con/loc chase".global_position[0]-64, $"war_map/Camera2D/des_con/loc chase".global_position[1])
			$overlay/TutorialArrow.rotation_degrees = 0
			explosion_pressed = true
	
###all of the positioning for the arrow needs sorting out and making relative.

###this is to test if restarting works, it looks like it does
func _input(event: InputEvent) -> void:
	
	###so, because ive changed everything to be done with touch screen checks
	###this breaks the inputs for the entire tutorial
	###i think because its checking if your inside the button at the same time
	###maybe if this is all inside a function, thats called by the various buttons
	###thatll have it the inside var as the correct one. 
	
	
	####alternativly i could put all the buttons into a trigger list
	###and just have a var iable inside that triggers at the right moment
	###it might save sometime fucking about with have two parrelel systems
	
	if event is InputEventScreenTouch and event.pressed or event.is_action_pressed("left_click"):
		print("here")
		if $war_map/Camera2D/ui_butts/upgrade.entered == true and open_pressed == false and tutorial_beats == 0:
			print($war_map/Camera2D/ui_butts/upgrade.entered)
			$tutorial_text.text = "Now press on the station in Tennessee"
			arrow_pos = Vector2($war_map/Camera2D/ConfedMap/spy_centers6.global_position[0]-64, $war_map/Camera2D/ConfedMap/spy_centers6.global_position[1])
			open_pressed = true
			tutorial_beats += 1
			###this will then blit some shit on the screen
			
		if $war_map/Camera2D/ConfedMap/spy_centers6.entered == true and station_pressed == false and tutorial_beats == 1:
			$tutorial_text.text = "Your spy center is now operational! This will generate Opperational Points each turn. Press the end turn button at the bottom when ready."
			arrow_pos = Vector2($war_map/Camera2D/ui_butts/turnbut.global_position[0]+160, $war_map/Camera2D/ui_butts/turnbut.global_position[1])
			$overlay/TutorialArrow.rotation_degrees = 180
			station_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and turn_pressed == false and tutorial_beats == 2:
			$tutorial_text.text = "A battle will now commence, the winner of which will sway the tide of war press the close button once the battle is over."
			arrow_pos = Vector2(get_viewport_rect().size[0]/2-32, get_viewport_rect().size[1] - 150)
			$overlay/TutorialArrow.rotation_degrees = 270
			turn_pressed = true
			tutorial_beats += 1
			
		if $war_map/battle_card.entered == true and battle_pressed == false and tutorial_beats == 3:
			$tutorial_text.text = "To be in with a chance of with winning battles we must find intel. Press the spy button!"
			arrow_pos = spy_loc
			$overlay/TutorialArrow.rotation_degrees = 0
			battle_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/recon.entered == true and spy_pressed == false and tutorial_beats == 4:
			$tutorial_text.text = "Now press on the station in Tennessee"
			arrow_pos = Vector2($war_map/Camera2D/ConfedMap/spy_centers6.global_position[0]-64, $war_map/Camera2D/ConfedMap/spy_centers6.global_position[1])
			spy_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ConfedMap/spy_centers6.entered == true and level_info.turn >= 3 and spying_pressed == false and tutorial_beats == 5:
			$tutorial_text.text = "The station will now work for two turns to gain intel. End your turn when ready."
			arrow_pos = Vector2($war_map/Camera2D/ui_butts/turnbut.global_position[0]+160, $war_map/Camera2D/ui_butts/turnbut.global_position[1])
			$overlay/TutorialArrow.rotation_degrees = 180
			spying_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and level_info.turn == 3 and turn_2_pressed == false and tutorial_beats == 6:
			$tutorial_text.text = "Spying costs OP. It might be a good idea to open some more stations if you can afford it."
			arrow_pos = Vector2($war_map/Camera2D/game_stats/op_power.global_position[0]+160, $war_map/Camera2D/game_stats/op_power.global_position[1]+160)
			$overlay/TutorialArrow.rotation_degrees = 260
			turn_2_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and level_info.turn == 4 and turn_3_pressed == false and tutorial_beats == 7:
			$tutorial_text.text = "You've generated intel in Tennessee, great job. Now press the move button, then click and drag the intel to the North. Moving intel costs OP. Intel must can only be moved to the next active station."
			arrow_pos = Vector2(Vector2($war_map/Camera2D/ConfedMap/north.global_position[0]-128, $war_map/Camera2D/ConfedMap/north.global_position[1]))
			$overlay/TutorialArrow.rotation_degrees = 0
			turn_3_pressed = true
			tutorial_beats += 1
		
		####come back here after sorting the key up
		###
		###
		if $war_map/Camera2D/ui_butts/count.entered == true and counter_pressed == false and tutorial_beats == 9:
			$tutorial_text.text = "Now press on Tennessee. This will start a counter spy operation that takes two turns. Once finished, your conspicuous meter will decrease. End your turn when ready."
			arrow_pos = Vector2($war_map/Camera2D/ConfedMap/spy_centers6.global_position[0]-64, $war_map/Camera2D/ConfedMap/spy_centers6.global_position[1])
			$overlay/TutorialArrow.rotation_degrees = 0
			counter_pressed = true
			tutorial_beats += 1
			
		if $war_map/battle_card.entered == true and turn_4_pressed == false and tutorial_beats == 10:
			$tutorial_text.text = "Notice the balance of power at the top here. Either side wins the war if they fill the bar, or whichever side has the biggest bar by May 1865."
			arrow_pos = Vector2(get_viewport_rect().size[0]/2, 200)
			$overlay/TutorialArrow.rotation_degrees = 270
			turn_4_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and turn_5_pressed == false and tutorial_beats == 11:
			$tutorial_text.text = "You now know enough to win the war. Good luck!"
			$overlay/TutorialArrow.visible = false
			turn_5_pressed = true
			save_cur_turn = level_info.turn
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and turn_6_pressed == false and tutorial_beats >= 12 and level_info.turn > save_cur_turn:
			if $tutorial_text.visible == true:
				$tutorial_text.visible = false
				$overlay/TutGuy.visible = false
			if $overlay/TutorialArrow.visible == true:
				$overlay/TutorialArrow.visible = false
			
		
	if event is InputEventScreenTouch and not event.pressed or event.is_action_pressed("left_click"):
		if $war_map/Camera2D/ConfedMap/north.current_intel != null and north_pressed == false and tutorial_beats == 8:
			$tutorial_text.text = "Notice the gold bar at the bottom filling up. This is how conspicuous your operation is. If it fills up too much your stations will be raided. Press the counter button."
			arrow_pos = Vector2(get_viewport_rect().size[0]/3-32, get_viewport_rect().size[1] - 100)
			$overlay/TutorialArrow.rotation_degrees = 90
			north_pressed = true
			tutorial_beats += 1
		
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
