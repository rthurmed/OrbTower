extends Node2D


onready var animation = $AnimationPlayer


func _ready():
	animation.play("bob")
