extends AudioStreamPlayer

func _ready() -> void:
	stream = load("res://audio/diving song.mp3")
	playing = true
	


func _on_finished():
	stream = load("res://audio/diving song.mp3")
	playing = true
	
