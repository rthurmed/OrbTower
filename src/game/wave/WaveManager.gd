extends Node


const HEADERS_TO_SKIP = 2
const MINUTE = 60 # seconds

export var config_name = 'level1'
export var wave_time = 1 * MINUTE
export (Array, NodePath) var lane_paths

onready var timer = $Timer

var current = -1
var configs = []
var spawner_nodes = []

signal updated_wave(wave_key)
signal ended


# Each line of the config file will have the amount of entities to spawn per
# minute for every spawner of the lanes.


func _unhandled_input(event):
	if event.is_action_released("skip_wave"):
		advance_current_wave()


func _ready():
	load_spawner_nodes()
	load_config()
	advance_current_wave()
	timer.wait_time = wave_time
	timer.start()


func load_spawner_nodes():
	spawner_nodes = []
	for lane_path in lane_paths:
		var lane_children = get_node(lane_path).get_children()
		spawner_nodes.append_array(lane_children)


func load_config():
	var file = File.new()
	var config_path = str("res://config/", config_name, ".csv")
	var _err = file.open(config_path, File.READ)
	
	for _i in range(0, HEADERS_TO_SKIP):
		var _line = file.get_csv_line()
	
	configs = []
	
	while file.get_position() < file.get_len():
		configs.append(file.get_csv_line())

	file.close()


func get_wave_config(wave: int):
	if wave >= configs.size(): return []
	return configs[wave]


func advance_current_wave():
	current += 1
	
	if current >= configs.size():
		emit_signal("ended")
		return
	
	setup_wave(current)
	emit_signal("updated_wave", current)


func setup_wave(wave_key: int):
	var config = get_wave_config(wave_key)
	
	if config.size() != spawner_nodes.size():
		print("Spawner nodes dont match with config!")
		return
	
	for key in config.size():
		var spawns_per_minute = float(config[key])
		var spawner: Spawner = spawner_nodes[key]
		
		if spawns_per_minute == 0:
			spawner.stop()
			continue
		
		var wait_time = MINUTE / spawns_per_minute
		spawner.set_timeout(wait_time)
		spawner.spawn()
		spawner.start()


func _on_Timer_timeout():
	advance_current_wave()
