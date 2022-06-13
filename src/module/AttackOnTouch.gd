extends Node2D


export var target_group = 'structure'
export var damage = 10
export var die_on_impact = false
export var holder_path: NodePath

onready var holder: Area2D = get_node(holder_path)


func _ready():
	if holder != null:
		var _ok = holder.connect("area_entered", self, "_on_Holder_area_entered")


func _on_Holder_area_entered(area: Area2D):
	if not area.is_in_group(target_group): return
	Health.cause_damage(area, damage)
	if die_on_impact:
		holder.queue_free()
		queue_free()
