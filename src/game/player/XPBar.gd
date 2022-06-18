extends Control


export var castle_health_path: NodePath

onready var xp_label = $Label
onready var wave_label = $Wave
onready var castle_hp_bar = $Castle/HPBar
onready var castle_health: Health = get_node(castle_health_path)


func _ready():
	var _ok
	_ok = Currency.connect("updated", self, "_on_Currency_updated")
	_ok = castle_health.connect("damage", self, "_on_Castle_Health_damage")


func _on_Currency_updated():
	xp_label.text = str("XP: ", Currency.value)


func _on_WaveManager_updated_wave(wave_key):
	wave_label.text = str("WAVE: ", wave_key + 1)


func _on_Castle_Health_damage(_damage, _hp):
	castle_hp_bar.max_value = castle_health.max_hp
	castle_hp_bar.value = castle_health.hp
