extends KinematicBody2D

var maxMoveSpeed = 800

var accelFrames = 5
var accel = maxMoveSpeed / accelFrames

var decelFrames = 25
var decel = maxMoveSpeed / decelFrames

var velocity = Vector2(0, 0)
var gravity = 60
var jumpSpeed = gravity * 30

func is_on_floor():
	$RayCast2D.force_raycast_update()
	if($RayCast2D.is_colliding()):
		return true
	return false

func _physics_process(delta):
	var left = -int(Input.is_action_pressed("ui_left"))
	var right = int(Input.is_action_pressed("ui_right"))
	var jump = -int(Input.is_action_pressed("ui_up"))
	
	if(abs(left) + right > 0):
		velocity.x += (left + right) * accel
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
		
	if(is_on_floor()):
		if(Input.is_action_pressed("ui_up")):
			velocity.y = -jumpSpeed
		else:
			velocity.y = 0
