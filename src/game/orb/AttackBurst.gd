extends Area2D


export var wait_time = 1.5
export var target_group = 'enemy'
export var damage = 2

onready var animation = $AnimationPlayer
onready var timer = $Timer


func _ready():
	timer.wait_time = wait_time


func _on_Timer_timeout():
	animation.play("burst")


func _on_AttackBurst_area_entered(area: Area2D):
	if not area.is_in_group(target_group): return
	Health.cause_damage(area, damage)
