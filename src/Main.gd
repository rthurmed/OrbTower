extends Node2D


onready var initial_spawner = $DownLane/SpawnerGhoul


func _ready():
	# Spawns a ghoul so the player can get an idea of the attacks
	initial_spawner.spawn()


func _on_Health_died():
	var _ok = get_tree().change_scene("res://src/game/GameOver.tscn")
