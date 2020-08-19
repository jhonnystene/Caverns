extends Control

var worldName = "World Name (FIXME)"
var levelPaths = ["", "", "", "", "", "", "", ""]
var levelsUnlocked = [false, false, false, false, false, false, false, false]

func _process(delta):
	$NameLabel.text = worldName
	
	for button in $LevelButtons.get_children():
		var buttonIndex = int(button.name) - 1
		if(levelPaths[buttonIndex] == ""):
			button.visible = false
		elif(levelsUnlocked[buttonIndex] == false):
			pass # TODO: Make button greyed out and disabled

func _on_1_pressed():
	get_tree().change_scene(levelPaths[0])

func _on_2_pressed():
	get_tree().change_scene(levelPaths[1])

func _on_3_pressed():
	get_tree().change_scene(levelPaths[2])

func _on_4_pressed():
	get_tree().change_scene(levelPaths[3])

func _on_5_pressed():
	get_tree().change_scene(levelPaths[4])

func _on_6_pressed():
	get_tree().change_scene(levelPaths[5])

func _on_7_pressed():
	get_tree().change_scene(levelPaths[6])

func _on_8_pressed():
	get_tree().change_scene(levelPaths[7])
