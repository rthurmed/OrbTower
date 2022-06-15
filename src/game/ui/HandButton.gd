extends TextureButton


export var orb_id = 0
export var amount = 0

onready var animation = $AnimationPlayer
onready var orb_sprite = $VisualInstance/Orb
onready var count_label = $Count/Label

signal selected(orb_id)


func _ready():
	orb_sprite.frame = orb_id
	count_label.text = str(amount)


func _on_HandButton_focus_entered():
	animation.play("focus")


func _on_HandButton_focus_exited():
	animation.play_backwards("focus")


func _on_HandButton_mouse_entered():
	_on_HandButton_focus_entered()


func _on_HandButton_mouse_exited():
	_on_HandButton_focus_exited()


func _on_HandButton_pressed():
	emit_signal("selected", orb_id)
