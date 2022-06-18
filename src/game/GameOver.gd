extends Control


onready var mock_player_animation = $AnimationPlayer

var can_continue = false


func _input(event):
	if not can_continue: return
	if not event.is_pressed(): return
	var _ok = get_tree().change_scene("res://src/Main.tscn")
	Soundtrack.set_deferred("playing", true)


func _ready():
	mock_player_animation.play("death")
	Soundtrack.set_deferred("playing", false)


func _on_AnimationPlayer_animation_finished(_anim_name):
	can_continue = true
