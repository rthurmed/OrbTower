class_name Health
extends Node2D


export var max_hp = 10
export var hp = 10
export var hp_visible_as_default = false
export var destroy_target_on_death = false
export var target_node_path: NodePath

onready var progress_bar = $ProgressBar
onready var target_node = get_node(target_node_path) if target_node_path else null

signal damage(damage, hp)
signal died


func _ready():
	progress_bar.visible = hp_visible_as_default
	update_view()


func update_view():
	progress_bar.max_value = max_hp
	progress_bar.value = hp


func hit(damage):
	progress_bar.visible = true
	
	hp -= damage
	update_view()
	emit_signal("damage", damage, hp)
	
	if hp <= 0:
		emit_signal("died")
		if destroy_target_on_death:
			target_node.queue_free()


static func cause_damage(area: Node2D, damage: int):
	var health = area.find_node('Health')
	if not health.has_method('hit'): return
	health.hit(damage)
