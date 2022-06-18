extends Node2D


onready var initial_spawner = $DownLane/SpawnerGhoul


func _ready():
	# Spawns a ghoul so the player can get an idea of the attacks
	initial_spawner.spawn()
