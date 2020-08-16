extends Node2D

func _on_Area2D_body_entered(body):
	if("Player" in body.name):
		body.position = Vector2(51, 2278)

func _process(delta):
	# Parallax Effect
	$Background.position = $Player.position / 5
	
	# Set pickup text
	var pickupName = ""
	if($Player.currentPickup == 0):
		pickupName = "None"
	elif($Player.currentPickup == 1):
		pickupName = "Double Jump"
	elif($Player.currentPickup == 2):
		pickupName = "Grappling Hook"
	else:
		pickupName = "Unknown (TELL ME IF YOU SEE THIS)"
	
	$UILayer/PickupLabel.text = "Current Pickup: " + pickupName
	
	# Set Debug text
	$UILayer/DebugInfo/PlayerPositionLabel.text = "X: " + str($Player.position.x) + ", Y: " + str($Player.position.y)
	$UILayer/DebugInfo/PlayerJumpCountLabel.text = "Jump Max: " + str($Player.maxChainedJumps) + ", Left: " + str($Player.jumps)
	$UILayer/DebugInfo/PlayerVelocityLabel.text = "VX: " + str($Player.velocity.x) + ", VY: " + str($Player.velocity.y)
	$UILayer/DebugInfo/FPSLabel.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS)) + ", Delta: " + str(delta)
	
	if(Input.is_action_just_pressed("ui_toggle_debug")):
		$UILayer/DebugInfo.visible = !$UILayer/DebugInfo.visible
			
