extends KinematicBody2D

var MOVESPEED = 100

var velocity = Vector2(0, 0)
var gravity = 6
var jumpSpeed = gravity * 30

func _physics_process(delta):
	var left = -int(Input.is_action_pressed("ui_left"))
	var right = int(Input.is_action_pressed("ui_right"))
	var jump = -int(Input.is_action_pressed("ui_up"))
	
	velocity.x = (left + right) * MOVESPEED
	velocity.y += gravity
	
	move_and_slide(velocity, Vector2(0, -1))
	if(is_on_ceiling() && velocity.y < 0):
		velocity.y = 0
		
	if(is_on_floor()):
		if(Input.is_action_pressed("ui_up")):
			velocity.y -= jumpSpeed
		else:
			velocity.y = 0
