extends Node2D

func _on_Area2D_body_entered(body):
	if("Player" in body.name):
		get_parent().do_pickup(body)
