extends Control

func _on_PlayButton_pressed():
	get_tree().change_scene("res://GameWorld.tscn")

func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Credits.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
