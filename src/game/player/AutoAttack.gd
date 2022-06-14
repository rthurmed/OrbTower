extends AutoAim


export var bullet: PackedScene
export var ysort_path: NodePath

onready var ysort = get_node(ysort_path) if ysort_path else null
onready var timer = $Timer


func shoot():
	if (
		ysort == null or
		target == null
	):
		return
	
	var instance = bullet.instance()
	
	instance.global_position = global_position
	instance.z_index = 10 # shows up over the player
	instance.target_path = target.get_path()
	
	ysort.add_child(instance)


func _on_Timer_timeout():
	shoot()
