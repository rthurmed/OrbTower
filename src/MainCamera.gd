extends Camera2D


export var castle_health_path: NodePath

onready var animation = $AnimationPlayer
onready var castle_health = get_node(castle_health_path)


func _ready():
	var _ok = castle_health.connect("damage", self, "_on_Castle_Health_damage")


func _on_Castle_Health_damage(_damage, _hp):
	animation.play("shake")
