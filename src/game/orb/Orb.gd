extends Node2D


const BASE_DAMAGE = 2

onready var animation = $AnimationPlayer


func _ready():
	animation.play("bob")


func _on_Burst_area_entered(area: Area2D):
	var health = area.find_node('Health')
	if not health is HealthModule: return
	health.hit(BASE_DAMAGE)
