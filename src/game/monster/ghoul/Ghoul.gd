extends Monster


onready var animation = $AnimationPlayer
onready var on_death_drop_xp = $OnDeathDropXP


func _ready():
	animation.play("walk")
	on_death_drop_xp.ysort = ysort
