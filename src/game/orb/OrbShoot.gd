extends Orb


onready var auto_attack = $AutoAttack


func _ready():
	auto_attack.ysort = ysort
