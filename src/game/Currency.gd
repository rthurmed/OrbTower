extends Node


var value = 0

signal updated


func increment(amount):
	value += amount
	emit_signal("updated")


func has(amount):
	return value >= amount
