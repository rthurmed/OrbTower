extends Area2D


export var wait_time = 1.5

onready var animation = $AnimationPlayer
onready var timer = $Timer


func _ready():
	timer.wait_time = wait_time


func _on_Timer_timeout():
	animation.play("burst")
