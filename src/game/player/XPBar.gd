extends Control


onready var xp_label = $Label
onready var wave_label = $Wave


func _ready():
	var _ok
	_ok = Currency.connect("updated", self, "_on_Currency_updated")


func _on_Currency_updated():
	xp_label.text = str("XP: ", Currency.value)


func _on_WaveManager_updated_wave(wave_key):
	wave_label.text = str("WAVE: ", wave_key + 1)
