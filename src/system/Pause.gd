extends CanvasLayer


onready var ui = $UI


func _unhandled_input(event):
	if event.is_action_released("pause"):
		paused(not get_tree().paused)
	
	if (
		ui.visible and
		event.is_action_released("reset")
	):
		var _ok = get_tree().reload_current_scene()
		paused(false)


func paused(state: bool):
	if state == get_tree().paused: return
	get_tree().paused = state
	ui.visible = state
