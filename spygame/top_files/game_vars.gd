extends Node

##turn for the game
var turn = 1
var date = 1861
var op = 10
var new_turn = false

##this is for the battles you prepare for
var battle_list = [["jidfdij", 2], ["ijdffjo", 4]]
var battle_ind = 0

##this is to do selected options
# 1 = upgrade or open center, 2 = is for closing one, 3 = recon, 4 = steal intel
var current_action = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()
		
	if event.is_action_pressed("upbut"):
		current_action = 1
		
	if event.is_action_pressed("downbut"):
		current_action = 2
		
	if event.is_action_pressed("recbut"):
		current_action = 3
		
	if event.is_action_pressed("opbut"):
		current_action = 4
		
	if event.is_action_pressed("newturn"):
		new_turn = true

