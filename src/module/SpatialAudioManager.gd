extends Node2D


func play_at(stream: AudioStream, global_pos: Vector2):
	var audio = AudioStreamPlayer2D.new()
	
	audio.stream = stream
	audio.autoplay = true
	audio.global_position = global_pos
	
	add_child(audio)
	
	yield(audio, "finished")
	audio.queue_free()
