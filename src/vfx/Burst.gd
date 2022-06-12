extends Area2D


onready var animation = $AnimationPlayer


func _ready():
	animation.play("burst")
