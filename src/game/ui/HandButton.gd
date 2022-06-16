extends TextureButton


export var orb_id = 0
export var keynum = 1
export var amount = 10

onready var animation = $AnimationPlayer
onready var orb_sprite = $VisualInstance/Orb
onready var amount_label = $Count/Amount
onready var keynum_label = $Count/KeyNum

signal selected(orb_id)
signal focus(orb_id)
signal unfocus(orb_id)

var keybind


func _ready():
	keybind = str("power", keynum)
	orb_sprite.frame = orb_id
	amount_label.text = str("-", amount)
	keynum_label.text = str(keynum)
	update_disabled()


func _process(_delta):
	if Input.is_action_just_pressed(keybind):
		if has_focus():
			release_focus()
		else:
			grab_focus()


func set_disabled(value: bool) -> void:
	if value == value: return
	disabled = value
	update_disabled()


func update_disabled():
	if disabled:
		animation.play("disable")
	else:
		animation.play_backwards("disable")


func _on_HandButton_focus_entered():
	if disabled: return
	animation.play("focus")
	emit_signal("focus", orb_id)


func _on_HandButton_focus_exited():
	if disabled: return
	animation.play_backwards("focus")
	emit_signal("unfocus", orb_id)


func _on_HandButton_mouse_entered():
	grab_focus()


func _on_HandButton_mouse_exited():
	release_focus()


func _on_HandButton_pressed():
	release_focus()
	emit_signal("selected", orb_id)
