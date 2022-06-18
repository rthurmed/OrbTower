extends Control


export var castle_health_path: NodePath
export var wave_manager_path: NodePath

onready var xp_label = $Label
onready var wave_label = $Wave
onready var wave_progress = $Wave/ProgressBar
onready var castle_hp_bar = $Castle/HPBar
onready var castle_health: Health = get_node(castle_health_path)
onready var wave_manager = get_node(wave_manager_path)


func _ready():
	var _ok
	_ok = Currency.connect("updated", self, "_on_Currency_updated")
	_ok = castle_health.connect("damage", self, "_on_Castle_Health_damage")
	_ok = wave_manager.connect("updated_wave", self, "_on_WaveManager_updated_wave")


func _process(_delta):
	# copy wave progress value
	var timer: Timer = wave_manager.timer
	wave_progress.max_value = timer.wait_time
	wave_progress.value = (timer.wait_time - timer.time_left) / timer.wait_time * 100


func _on_Currency_updated():
	xp_label.text = str("XP: ", Currency.value)


func _on_WaveManager_updated_wave(wave_key):
	wave_label.text = str("WAVE: ", wave_key + 1)


func _on_Castle_Health_damage(_damage, _hp):
	castle_hp_bar.max_value = castle_health.max_hp
	castle_hp_bar.value = castle_health.hp
