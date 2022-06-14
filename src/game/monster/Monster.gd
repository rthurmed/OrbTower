class_name Monster
extends Area2D


export var speed = 30 # px/s (the main path has ~900px in length)
export var path_node_path: NodePath
export var ysort_path: NodePath

onready var path_node = get_node(path_node_path)
onready var ysort = get_node(ysort_path)
onready var path_follower = $PathFollower


func _ready():
	path_follower.speed = speed
	path_follower.path_node = path_node
	path_follower.setup()


func _process(delta):
	path_follower.advance(delta)
	global_position = path_follower.get_adjusted_position()
