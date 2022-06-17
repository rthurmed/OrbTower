class_name AutoAim
extends Area2D


const RETARGET_TIME = .2

export var target_group = 'enemy'
export var single_look = false

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


func reload():
	monitoring = false
	yield(get_tree().create_timer(RETARGET_TIME), "timeout")
	monitoring = true


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
		target = null
		
		if not single_look:
			reload()
