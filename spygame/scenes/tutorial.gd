extends Node2D

@onready var level_info = get_node("/root/GameVars")

###tutorial beats to make sure the player doesnt accidently skip half the tutorial
var tutorial_beats = 0

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
	$overlay/TutorialArrow.position = arrow_pos
	#var screen_size = get_viewport_rect().size
	#var map_scale_factor = (screen_size.x / 1920.0)*2
	#$overlay.scale = Vector2(map_scale_factor, map_scale_factor)

func _process(delta: float) -> void:
	$overlay/TutorialArrow.position = arrow_pos
	
	if $war_map/Camera2D/ConfedMap/spy_centers11.operational == true or $war_map/Camera2D/ConfedMap/spy_centers7.operational == true:
		if explosion_pressed == false:
			$tutorial_text.text = "This state has a target you can attack. Attacking the target will give you war score, but cost a large amount of OP. To attack, press the target button then the image. If you have enough OP."
			
			if $war_map/Camera2D/ConfedMap/spy_centers11.operational == true:
				arrow_pos = Vector2($"war_map/Camera2D/des_con/css albemarle".position[0]+200, $"war_map/Camera2D/des_con/css albemarle".position[1])
			
			if $war_map/Camera2D/ConfedMap/spy_centers7.operational == true:
				arrow_pos = Vector2($"war_map/Camera2D/des_con/loc chase".position[0]+200, $"war_map/Camera2D/des_con/loc chase".position[1])
			
			explosion_pressed = true

###all of the positioning for the arrow needs sorting out and making relative.

###this is to test if restarting works, it looks like it does
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if $war_map/Camera2D/ui_butts/upgrade.entered == true and open_pressed == false and tutorial_beats == 0:
			$tutorial_text.text = "Now press on the station in Tennessee"
			arrow_pos = Vector2($war_map/Camera2D/ConfedMap/spy_centers6.position[0] + $war_map/Camera2D/ConfedMap.position[0], $war_map/Camera2D/ConfedMap/spy_centers6.position[1])
			open_pressed = true
			tutorial_beats += 1
			###this will then blit some shit on the screen
			
		if $war_map/Camera2D/ConfedMap/spy_centers6.entered == true and station_pressed == false and tutorial_beats == 1:
			$tutorial_text.text = "Your spy center is now operational! This will generate Opperational Points each turn. Press the end turn button at the bottom when ready."
			arrow_pos = Vector2(380, 720)
			$overlay/TutorialArrow.rotation = -180
			station_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and turn_pressed == false and tutorial_beats == 2:
			$tutorial_text.text = "A battle will now commence, the winner of which will sway the tide of war press the close button once the battle is over."
			arrow_pos = Vector2(get_viewport_rect().size[0]/2, get_viewport_rect().size[1] - 200)
			$overlay/TutorialArrow.rotation = -180
			turn_pressed = true
			tutorial_beats += 1
			
		if $war_map/battle_card.entered == true and battle_pressed == false and tutorial_beats == 3:
			$tutorial_text.text = "To be in with a chance of with winning battles we must find intel. Press the spy button!"
			arrow_pos = Vector2(1705, 359)
			$overlay/TutorialArrow.rotation = 0
			battle_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/recon.entered == true and spy_pressed == false and tutorial_beats == 4:
			$tutorial_text.text = "Now press on the station in Tennessee"
			arrow_pos = Vector2(1094, 347)
			spy_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ConfedMap/spy_centers6.entered == true and level_info.turn >= 3 and spying_pressed == false and tutorial_beats == 5:
			$tutorial_text.text = "The station will now work for two turns to gain intel. End your turn when ready."
			arrow_pos = Vector2(380, 720)
			$overlay/TutorialArrow.rotation = -180
			spying_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and level_info.turn == 3 and turn_2_pressed == false and tutorial_beats == 6:
			$tutorial_text.text = "Spying costs OP. It might be a good idea to open some more stations if you can afford it."
			arrow_pos = Vector2(get_viewport_rect().size[0]/2, get_viewport_rect().size[1] - 200)
			$overlay/TutorialArrow.rotation = -180
			turn_2_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and level_info.turn == 4 and turn_3_pressed == false and tutorial_beats == 7:
			$tutorial_text.text = "You've generated intel in Tennessee, great job. Now press the move button, then click and drag the intel to the North. Moving intel costs OP. Intel must can only be moved to the next active station."
			arrow_pos = Vector2(1099, 170)
			$overlay/TutorialArrow.rotation = 0
			turn_3_pressed = true
			tutorial_beats += 1
		
		if $war_map/Camera2D/ui_butts/count.entered == true and counter_pressed == false and tutorial_beats == 9:
			$tutorial_text.text = "Now press on Tennessee. This will start a counter spy operation that takes two turns. Once finished, your conspicuous meter will decrease. End your turn when ready."
			arrow_pos = Vector2(380, 720)
			$overlay/TutorialArrow.rotation = 0
			counter_pressed = true
			tutorial_beats += 1
			
		if $war_map/battle_card.entered == true and turn_4_pressed == false and tutorial_beats == 10:
			$tutorial_text.text = "Notice the balance of power at the top here. Either side wins the war if they fill the bar, or whichever side has the biggest bar by May 1865."
			turn_4_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and turn_5_pressed == false and tutorial_beats == 11:
			$tutorial_text.text = "You now know enough to win the war. Good luck!"
			turn_5_pressed = true
			tutorial_beats += 1
			
		if $war_map/Camera2D/ui_butts/turnbut.entered == true and turn_6_pressed == false and tutorial_beats >= 12:
			$tutorial_text.visible = false
		
	if event.is_action_released("left_click"):
		if $war_map/Camera2D/ConfedMap/north.current_intel != null and north_pressed == false and tutorial_beats == 8:
			$tutorial_text.text = "Notice the gold bar at the bottom filling up. This is how conspicuous your operation is. If it fills up too much your stations will be raided. Press the counter button."
			north_pressed = true
			tutorial_beats += 1
		
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
