extends Node2D

@onready var scores = [$Score, $Score2, $Score3, $Score4]
var score_index = 0
@onready var score = scores[0]
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	score.animation_player.play("progress")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_oud_button_pressed_note(label_note):
	print(label_note)
	if score.score_list[score.state] == label_note:
		print("same")
		score.state += 1
		if score.state == score.score_list.size():
			print("score done")
			score_index += 1
			if score_index < scores.size():
				score.visible = false
				score = scores[score_index]
				score.animation_player.play("progress")
			else:
				print("you win!")
				await get_tree().create_timer(0.5).timeout
				audio_stream_player_2d.play()
				get_tree().change_scene_to_file("res://Overworld.tscn")
	else:
		print("not same")

func _input(event):
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://title_screen.tscn")
