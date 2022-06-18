extends Node2D


onready var initial_spawner = $DownLane/SpawnerGhoul
onready var you_win = $Overlay/YouWin


func _ready():
	# Spawns a ghoul so the player can get an idea of the attacks
	initial_spawner.spawn()


func _process(_delta):
	if Input.is_action_just_released("pause"):
		you_win.visible = false


func _on_Health_died():
	var _ok = get_tree().change_scene("res://src/game/GameOver.tscn")


func _on_WaveManager_ended():
	get_tree().paused = true
	you_win.visible = true
