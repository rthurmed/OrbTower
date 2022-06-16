extends Node


var value = 8

signal updated


func increment(amount):
	value += amount
	emit_signal("updated")


func has(amount):
	return value >= amount
