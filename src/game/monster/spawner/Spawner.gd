class_name Spawner
extends Node2D


export var monster: PackedScene
export var wait_time: float = 60
export var delay: float = 0
export var ysort_path: NodePath

onready var ysort = get_node(ysort_path)

var timer: Timer = null


func _ready():
	if delay > 0:
		yield(get_tree().create_timer(delay), "timeout")
	
	timer = Timer.new()
	timer.autostart = true
	timer.wait_time = wait_time
	add_child(timer)
	var _ok = timer.connect("timeout", self, "_on_Timer_timeout")


func start():
	timer.start()


func stop():
	timer.stop()


func spawn():
	var instance = monster.instance()
	instance.global_position = global_position
	ysort.add_child(instance)


func set_timeout(value):
	wait_time = value
	timer.wait_time = value


func _on_Timer_timeout():
	spawn()
