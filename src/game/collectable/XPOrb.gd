extends Area2D


const VALUE = 1

onready var chase_target = $ChaseTarget
onready var auto_aim = $AutoAim


func _process(delta):
	if chase_target.target != null:
		chase_target.advance(delta)


func _on_AutoAim_change_target():
	if auto_aim.target == null: return
	chase_target.target_path = auto_aim.target.get_path()
	chase_target.setup()


func _on_XPOrb_area_entered(area: Area2D):
	if area.is_in_group('player'):
		queue_free()
		Currency.increment(VALUE)
