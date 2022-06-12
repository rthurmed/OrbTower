extends KinematicBody2D


const SPEED = 200
const DECELERATION = 12

var move = Vector2.ZERO


func _process(delta):
	var i_move = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	i_move = i_move.normalized()
	i_move = i_move * SPEED
	move = lerp(move, i_move, delta * DECELERATION)
	var _slide = move_and_slide(move)
