extends Node2D


export var path_offset_rand = 16
export var speed = 30 # px/s (the main path has ~900px in length)
export var path_node_path: NodePath

onready var path_node: Path2D = get_node(path_node_path) if path_node_path else null

var path_follow: PathFollow2D
var path_offset = Vector2.ZERO


func setup():
	path_follow = PathFollow2D.new()
	path_follow.rotate = false
	path_follow.cubic_interp = true
	path_node.add_child(path_follow)
	
	path_offset = Vector2(
		rand_range(-path_offset_rand, path_offset_rand),
		rand_range(-path_offset_rand, path_offset_rand)
	)


func advance(delta):
	path_follow.offset += speed * delta


func get_adjusted_position():
	return path_follow.global_position + path_offset


func _on_PathFollower_tree_exiting():
	path_follow.queue_free()
