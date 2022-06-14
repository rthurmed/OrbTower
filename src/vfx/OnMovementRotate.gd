extends Node2D


export var offset_degress = 0

var last_position = Vector2.ZERO


func _process(_delta):
	var angle = global_position.angle_to_point(last_position)
	get_parent().global_rotation = angle + deg2rad(offset_degress)
	last_position = global_position
