extends Node


var value = 0

signal updated


func _unhandled_input(event):
	if event.is_action_released("cheat1"):
		increment(9999)


func increment(amount):
	value += amount
	emit_signal("updated")


func has(amount):
	return value >= amount
