extends TextureButton

@onready var audio_stream_player_white = $AudioStreamPlayerWhite
@onready var audio_stream_player_black = $AudioStreamPlayerBlack
@export var track_stream : AudioStream
@export var track_stream_alt : AudioStream
@export var keycode = KEY_Q
@onready var label:Label = $Label

@export var label_note = "C"
var playing = false
var white = true

signal pressed_note(label_note: String)


# Called when the node enters the scene tree for the first time.
func _ready():
	audio_stream_player_white.stream = track_stream
	audio_stream_player_black.stream = track_stream_alt
	label.text = label_note


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	if white:
		audio_stream_player_white.play()
	else:
		audio_stream_player_black.play()
	send_signal()
	#await get_tree().create_timer(0.1).timeout


func _on_button_up():
	self.button_pressed = false


func _input(event):
	if event is InputEventKey:
		if event.keycode == keycode:
			if event.is_pressed():
				send_signal()
				self.button_pressed = true
				if not playing:
					# Play the sound
					if white:
						audio_stream_player_white.play()
					else:
						audio_stream_player_black.play()
					playing = true
			elif event.is_released():
				self.button_pressed = false
				playing = false
	if Input.is_action_just_pressed("pitch_up"):
		white = false
		label.text = label_note+"#"
		label.set("theme_override_font_sizes/font_size", 18)
	elif Input.is_action_just_released("pitch_up"):
		white = true
		label.text = label_note
		label.set("theme_override_font_sizes/font_size", 24)


func _on_audio_stream_player_2d_finished():
	pass # Replace with function body.

func send_signal():
	if white:
		emit_signal("pressed_note", label_note)
	else:
		emit_signal("pressed_note", label_note+"#")
