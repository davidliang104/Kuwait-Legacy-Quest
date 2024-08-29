extends AudioStreamPlayer

func _ready() -> void:
	stream = load("res://audio/Road to Mecca (128 kbps).mp3")
	playing = true
	


func _on_finished():
	stream = load("res://audio/Road to Mecca (128 kbps).mp3")
	playing = true
	
