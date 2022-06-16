extends TextureButton


export var orb_id = 0
export var keynum = 1
export var cost = 10

onready var animation = $AnimationPlayer
onready var orb_sprite = $VisualInstance/Orb
onready var cost_label = $Count/Cost
onready var keynum_label = $Count/KeyNum

signal selected(orb_id, cost)
signal focus(orb_id)
signal unfocus(orb_id)

var keybind


func _ready():
	keybind = str("power", keynum)
	orb_sprite.frame = orb_id
	cost_label.text = str("-", cost)
	keynum_label.text = str(keynum)
	
	var _ok = Currency.connect("updated", self, "_on_Currency_updated")
	_on_Currency_updated()


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


func _on_Currency_updated():
	var new_disabled = not Currency.has(cost)
	var value_has_changed = new_disabled != disabled
	
	disabled = new_disabled
	
	if value_has_changed:
		update_disabled()


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
	emit_signal("selected", orb_id, cost)
