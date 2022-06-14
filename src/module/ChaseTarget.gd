extends Node2D


export var speed = 50 # px/s
export var holder_path: NodePath
export var target_path: NodePath

onready var holder: Node2D
onready var target: Node2D


func setup():
	holder = get_node(holder_path)
	target = get_node(target_path)


func advance(delta):
	if target == null or not target.is_inside_tree(): return
	var direction = holder.global_position.direction_to(target.global_position)
	var movement = direction * speed * delta
	holder.global_position += movement
