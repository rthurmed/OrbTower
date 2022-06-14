extends Node2D


export var speed = 50 # px/s
export var holder_path: NodePath
export var target_path: NodePath

onready var holder: Node2D
onready var target: Node2D


func setup():
	holder = get_node(holder_path)
	target = get_node(target_path)
	var _ok = target.connect("tree_exiting", self, "_on_Target_tree_exiting")


func advance(delta):
	if target == null: return
	var direction = holder.global_position.direction_to(target.global_position)
	var movement = direction * speed * delta
	holder.global_position += movement


func _on_Target_tree_exiting():
	target.disconnect("tree_exiting", self, "_on_Target_tree_exiting")
	target = null
