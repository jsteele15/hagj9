extends Node2D

###so these will be the exploding shit

##to decide what the image is and what station its linked to
@export var linked_station : Node2D
@export var fra : int

#to decide if the thing should be visible
var active = false

#if the thing has been visible for 5 turns the oppertunity will disapear
var turn = 0

func _ready() -> void:
	$ExplodableSheet.frame = fra
