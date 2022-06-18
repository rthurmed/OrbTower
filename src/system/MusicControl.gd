extends Control


onready var check_button = $CheckButton


func _ready():
	check_button.pressed = Soundtrack.playing


func _on_CheckButton_toggled(button_pressed):
	Soundtrack.playing = button_pressed
