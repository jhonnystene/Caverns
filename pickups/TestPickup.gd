extends Node2D

func do_pickup(body):
	print("Test pickup picked up by: " + body.name)
	queue_free()
