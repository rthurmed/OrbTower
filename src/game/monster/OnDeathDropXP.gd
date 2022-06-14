extends Node2D


export var xp_orb: PackedScene
export var amount = 4
export var rand_distance = 8
export var health_path: NodePath

onready var holder_health = get_node(health_path)

var ysort: YSort


func _ready():
	var _ok = holder_health.connect("died", self, "_on_Holder_Health_died")


func drop_xp_orbs():
	for _i in range(amount):
		var offset = Vector2(
			rand_range(-rand_distance, rand_distance),
			rand_range(-rand_distance, rand_distance)
		)
		var instance = xp_orb.instance()
		instance.global_position = global_position + offset
		ysort.add_child(instance)


func _on_Holder_Health_died():
	drop_xp_orbs()
