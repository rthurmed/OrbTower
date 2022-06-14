extends Area2D


export var target_path: NodePath

onready var chase_target = $ChaseTarget


func _ready():
	chase_target.target_path = get_node(target_path).get_path()
	chase_target.setup()


func _process(delta):
	chase_target.advance(delta)
