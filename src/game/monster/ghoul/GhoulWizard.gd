extends Ghoul


onready var auto_attack = $AutoAttack


func _ready():
	auto_attack.ysort = ysort
