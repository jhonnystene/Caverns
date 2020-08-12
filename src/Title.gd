extends Control

func _on_PlayButton_pressed():
	get_tree().change_scene("res://scenes/GameWorld.tscn")

func _on_CreditsButton_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
