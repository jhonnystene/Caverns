extends Node2D

func do_pickup(body):
	body.currentPickup = 3
	queue_free()
