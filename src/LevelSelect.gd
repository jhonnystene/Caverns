extends Control

var currentWorld = 0

func _ready():
	$Worlds/World0.worldName = "Tutorial"
	$Worlds/World0.levelPaths[0] = "res://levels/tutorial/TutorialLevel1.tscn"
	$Worlds/World0.levelsUnlocked[0] = true
	
	$Worlds/World1.worldName = "World 1"

func _process(delta):
	if(currentWorld == 0):
		$BackButton.disabled = true
	else:
		$BackButton.disabled = false
	if(-currentWorld == $Worlds.get_child_count() - 1):
		$NextButton.disabled = true
	else:
		$NextButton.disabled = false
	
	if($Worlds.position.x > currentWorld * 1024):
		$Worlds.position.x -= 32
	elif($Worlds.position.x < currentWorld * 1024):
		$Worlds.position.x += 32
	
func _on_BackButton_pressed():
	currentWorld += 1

func _on_NextButton_pressed():
	currentWorld -= 1
