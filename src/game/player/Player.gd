extends KinematicBody2D


const SPEED = 200
const DECELERATION = 12

export var ysort_path: NodePath

onready var ysort = get_node(ysort_path)
onready var placement_anchor = $PlacementAnchor

var Orbs = [
	preload("res://src/game/orb/OrbBurst.tscn"),
	preload("res://src/game/orb/OrbShoot.tscn"),
	preload("res://src/game/orb/OrbHeal.tscn")
]
var move = Vector2.ZERO


func _process(delta):
	var i_move = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	i_move = i_move.normalized()
	i_move = i_move * SPEED
	move = lerp(move, i_move, delta * DECELERATION)
	var _slide = move_and_slide(move)


func _on_HandButton_selected(orb_id, cost):
	var orb_scene = Orbs[orb_id]
	var instance = orb_scene.instance()
	
	Currency.increment(-cost)
	
	# TODO: Block from being placed too close from another orb
	instance.global_position = placement_anchor.global_position
	instance.ysort_path = ysort_path
	
	ysort.add_child(instance)
