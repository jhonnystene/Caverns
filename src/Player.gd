extends KinematicBody2D

# 0 - None
# 1 - Double Jump
# 2 - Grapple Hook
var currentPickup = 0

var maxMoveSpeed = 600

var accelFrames = 5
var accel = maxMoveSpeed / accelFrames

var decelFrames = 25
var decel = maxMoveSpeed / decelFrames

var velocity = Vector2(0, 0)
var gravity = 30
var jumpSpeed = gravity * 30
var maxChainedJumps = 1
var jumps = 0

func is_on_floor():
	$RayCast2D.force_raycast_update()
	if($RayCast2D.is_colliding()):
		return true
	return false
	
func _process(delta):
	if(currentPickup == 1):
		maxChainedJumps = 2
	else:
		maxChainedJumps = 1

func _physics_process(delta):
	#var left = -int(Input.is_action_pressed("ui_left"))
	#var right = int(Input.is_action_pressed("ui_right"))
	var horiz = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var jump = -int(Input.is_action_pressed("ui_up"))
	
	if(horiz != 0):
		velocity.x += horiz * accel
	else:
		velocity.x += -sign(velocity.x) * decel
		
	if(velocity.x > maxMoveSpeed):
		velocity.x = maxMoveSpeed
	if(velocity.x < -maxMoveSpeed):
		velocity.x = -maxMoveSpeed
		
	velocity.y += gravity
	
	move_and_slide(velocity, Vector2(0, -1))
	if(is_on_ceiling() && velocity.y < 0):
		velocity.y = 0
		
	var checkJustPressed = true
	
	if(is_on_floor()):
		jumps = maxChainedJumps
		velocity.y = 0
		if(Input.is_action_pressed("ui_up")):
			velocity.y -= jumpSpeed
			jumps -= 1
			checkJustPressed = false
	
	if(Input.is_action_just_pressed("ui_up") && checkJustPressed):
		if(jumps > 0):
			if(velocity.y > 0):
				velocity.y = -jumpSpeed
			else:
				velocity.y -= jumpSpeed
			
			jumps -= 1
