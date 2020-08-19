extends Node2D

var deathSpot = Vector2(0, 0)

func complete():
	get_tree().change_scene("res://scenes/menus/Title.tscn")

func _ready():
	deathSpot = $Player.position

func _on_Area2D_body_entered(body):
	if("Player" in body.name):
		body.position = deathSpot

func _process(delta):
	# Parallax Effect
	$Background.position = $Player.position / 5
	#$ParralaxText.position = $Player.position / 4
	#$ParralaxText.position.y -= 180
	
	# Set pickup text
	var pickupName = ""
	if($Player.currentPickup == 0):
		pickupName = "None"
	elif($Player.currentPickup == 1):
		pickupName = "Double Jump"
	elif($Player.currentPickup == 2):
		pickupName = "Grappling Hook"
	elif($Player.currentPickup == 3):
		pickupName = "Jetpack"
	else:
		pickupName = "Unknown (TELL ME IF YOU SEE THIS)"
	
	$UILayer/PickupLabel.text = "Current Pickup: " + pickupName
	
	# Set Debug text
	$UILayer/DebugInfo/PlayerPositionLabel.text = "X: " + str($Player.position.x) + ", Y: " + str($Player.position.y)
	$UILayer/DebugInfo/PlayerJumpCountLabel.text = "Jump Max: " + str($Player.maxChainedJumps) + ", Left: " + str($Player.jumps)
	$UILayer/DebugInfo/PlayerVelocityLabel.text = "VX: " + str($Player.velocity.x) + ", VY: " + str($Player.velocity.y)
	$UILayer/DebugInfo/FPSLabel.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS)) + ", Delta: " + str(delta)
	$UILayer/DebugInfo/JetpackTimeLabel.text = "Jetpack Time Left: " + str($Player.jetpackTimeLeft)
	
	if(Input.is_action_just_pressed("ui_toggle_debug")):
		$UILayer/DebugInfo.visible = !$UILayer/DebugInfo.visible
			
