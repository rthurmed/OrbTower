extends Node2D


onready var orb_sprite = $MockOrb/Sprite


func _on_HandButton_focus(orb_id):
	orb_sprite.frame = orb_id
	visible = true


func _on_HandButton_unfocus(_orb_id):
	visible = false
