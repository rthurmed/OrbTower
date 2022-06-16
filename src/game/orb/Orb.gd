class_name Orb
extends Area2D


export var target_group = 'enemy'
export var ysort_path: NodePath

onready var ysort = get_node(ysort_path)
onready var animation = $AnimationPlayer


func _ready():
	animation.play("bob")
