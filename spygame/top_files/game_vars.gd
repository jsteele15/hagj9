extends Node

##turn for the game
var turn = 1
var date = 1861
var op = 0
var new_turn = false

##this is to do selected options
# 1 = upgrade or open center, 2 = is for closing one, 3 = recon, 4 = steal intel
var current_action = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().quit()

