extends Node2D


export var bullet: PackedScene
export var ysort_path: NodePath

onready var ysort = get_node(ysort_path)
onready var timer = $Timer
onready var auto_aim = $AutoAim


func shoot():
	if auto_aim.target == null: return
	var instance = bullet.instance()
	instance.global_position = global_position
	instance.z_index = 10 # shows up over the player
	instance.target_path = auto_aim.target.get_path()
	ysort.add_child(instance)


func _on_Timer_timeout():
	shoot()
