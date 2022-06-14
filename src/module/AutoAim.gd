class_name AutoAim
extends Area2D


export var target_group = 'enemy'

var target: Node2D

signal change_target


func _ready():
	var _ok
	if not is_connected("area_entered", self, "_on_AutoAim_area_entered"):
		_ok = connect("area_entered", self, "_on_AutoAim_area_entered")
	if not is_connected("area_exited", self, "_on_AutoAim_area_exited"):
		_ok = connect("area_exited", self, "_on_AutoAim_area_exited")


func set_target(node: Node2D):
	if target == node: return
	target = node
	emit_signal("change_target")
	
	if not target.is_connected("tree_exited", self, "_on_Target_tree_exited"):
		var _ok = target.connect("tree_exited", self, "_on_Target_tree_exited")


func reload():
	monitoring = false
	monitoring = true


func _on_Target_tree_exited():
	reload()


func _on_AutoAim_area_entered(area: Area2D):
	if not area.is_in_group(target_group):
		return
	
	if target == null:
		set_target(area)
		return
	
	var target_distance = global_position.distance_to(target.global_position)
	var area_distance = global_position.distance_to(area.global_position)
	
	if target_distance < area_distance:
		return
	
	set_target(area)


func _on_AutoAim_area_exited(area):
	if (
		target != null and
		area.name == target.name
	):
		target.disconnect("tree_exited", self, "_on_Target_tree_exited")
		target = null
