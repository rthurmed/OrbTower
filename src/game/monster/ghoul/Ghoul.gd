extends Monster


onready var animation = $AnimationPlayer


func _ready():
	animation.play("walk")
