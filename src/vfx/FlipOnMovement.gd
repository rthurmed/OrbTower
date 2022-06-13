extends Node2D


var last_position = Vector2.ZERO


func _process(_delta):
	var flip = -1
	
	if global_position.x < last_position.x:
		flip = 1
	
	get_parent().scale.x = flip
	
	last_position = global_position
