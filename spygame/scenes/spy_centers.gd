extends Node2D

@onready var level_info = get_node("/root/GameVars")

##this is to show whether station is opperational
var operational = false
var change_trig = true

##ton see if the mouse is over the station
var entered = false
var cost = 10
var power_points = 10

##alertness of the authorities
var alertness = 0

###this is to work out its level of recon or if its currently reconing 
var reconing = false
var recon_lv = 0

###this is to work out if there's intel at a station
var intel_here = false

func _ready() -> void:
	$".".scale = Vector2(0.6, 0.6)
	$alertlv.size.x = alertness
	$reconlv.size.x = recon_lv

func _process(delta: float) -> void:
	
	###this is for changing the colour of the awareness rect depending on what level its at
	$alertlv.size.x = alertness
	if $alertlv.size.x <= 16:
		$alertlv.modulate = "658300"
		
	if $alertlv.size.x > 16 and $alertlv.size.x <= 28:
		$alertlv.modulate = "e7a315"
		
	if $alertlv.size.x >= 28.8:
		$alertlv.modulate = "c2002e"
	
	###this is for changing the recon level bar, definatly doesnt need to be done every frame, might change this if i have timne
	
	$reconlv.size.x = recon_lv
	if $reconlv.size.x <= 16:
		$reconlv.modulate = "c2002e"
		
	if $reconlv.size.x > 16 and $reconlv.size.x <= 28:
		$reconlv.modulate = "e7a315"
		
	if $reconlv.size.x >= 28.8:
		$reconlv.modulate = "658300"
	
	if reconing == true:
		$SpyGlass.visible = true
	if reconing == false:
		$SpyGlass.visible = false
	
	###this is for working out if the center is operational or not
	if operational == false:
		$SpyCenter.modulate = "ffffff"
		if $".".scale.x > 0.5:
			$".".scale.x -= 0.01
			$".".scale.y -= 0.01
	if operational == true:
		$SpyCenter.modulate = "4b6691"
		if $".".scale.x < 1:
			$".".scale.x += 0.01
			$".".scale.y += 0.01


func _input(event: InputEvent) -> void:
	##this allows you to set up a spy center
	if event.is_action_released("left_click") and entered == true and level_info.current_action == 1:
		if cost <= level_info.op and operational == false:
			level_info.op -= cost
			operational = true
	
	##this allows you to close said center
	if event.is_action_released("left_click") and entered == true and level_info.current_action == 2:
		if operational == true:
			level_info.op += 5
			operational = false
			
	if event.is_action_released("left_click") and entered == true and level_info.current_action == 3:
		if operational == true and reconing == false:
			level_info.op -= cost
			reconing = true



func _on_area_2d_mouse_entered() -> void:
	entered = true

func _on_area_2d_mouse_exited() -> void:
	entered = false
