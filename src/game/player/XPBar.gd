extends Control


onready var xp_label = $Label


func _ready():
	var _ok
	_ok = Currency.connect("updated", self, "_on_Currency_updated")


func _on_Currency_updated():
	xp_label.text = str("XP: ", Currency.value)
