extends KinematicBody2D


const SPEED = 200
const DECELERATION = 12

onready var xp_label = $UI/XPBar/Label

var move = Vector2.ZERO


func _ready():
	var _ok
	_ok = Currency.connect("updated", self, "_on_Currency_updated")


func _process(delta):
	var i_move = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	i_move = i_move.normalized()
	i_move = i_move * SPEED
	move = lerp(move, i_move, delta * DECELERATION)
	var _slide = move_and_slide(move)


func _on_Currency_updated():
	xp_label.text = str("XP: ", Currency.value)


func _on_HandButton_selected(orb_id):
	# TODO: place orb on placement anchor
	print(orb_id)
