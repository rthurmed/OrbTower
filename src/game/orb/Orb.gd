class_name Orb
extends Node2D


const BASE_DAMAGE = 2

export var target_group = 'enemy'
export var ysort_path: NodePath

onready var ysort = get_node(ysort_path)
onready var animation = $AnimationPlayer


func _ready():
	animation.play("bob")


func _on_Burst_area_entered(area: Area2D):
	if not area.is_in_group(target_group): return
	Health.cause_damage(area, BASE_DAMAGE)
