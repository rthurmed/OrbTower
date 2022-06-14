extends Node


var value = 0

signal updated


func add(amount):
	value += amount
	emit_signal("updated")


func remove(amount):
	value -= amount
	emit_signal("updated")


func has(amount):
	return value >= amount
