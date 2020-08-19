extends Control

var prevScreen = "res://scenes/menus/Title.tscn"

func _on_BackButton_pressed():
	get_tree().change_scene(prevScreen)
