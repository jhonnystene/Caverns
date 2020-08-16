extends Node2D

func do_pickup(body):
	body.currentPickup = 1
	queue_free()
