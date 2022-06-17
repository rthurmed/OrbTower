extends Spawner


export var path_node_path: NodePath


func _process(_delta):
	if Input.is_action_just_pressed("ui_end"):
		print(name, ": ", timer.time_left)


func spawn():
	var instance = monster.instance()
	instance.global_position = global_position
	instance.path_node_path = get_node(path_node_path).get_path()
	instance.ysort_path = get_node(ysort_path).get_path()
	ysort.add_child(instance)
