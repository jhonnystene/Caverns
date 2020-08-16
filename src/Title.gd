extends Node2D

func _process(delta):
	$Background.position = $Player.position / 5

func _on_PlayArea_body_entered(body):
	if("Player" in body.name):
		get_tree().change_scene("res://scenes/GameWorld.tscn")

func _on_CreditsArea_body_entered(body):
	if("Player" in body.name):
		get_tree().change_scene("res://scenes/Credits.tscn")
