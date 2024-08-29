extends Node2D

@onready var player = $ParallaxBackground/Player
@onready var player_spawn_pos = $PlayerSpawnPos
@onready var pearl_game_manager = %PearlGameManager
@onready var pearl = $ParallaxBackground/Pearl
@onready var bubble = $ParallaxBackground/Bubble
@onready var audio_stream_player_2d = $ParallaxBackground/Player/Background
@onready var bubble_audio = $ParallaxBackground/Player/BubbleAudio
@onready var hurt_audio = $ParallaxBackground/Player/HurtAudio
@onready var pearl_audio = $ParallaxBackground/Player/PearlAudio

# Called when the node enters the scene tree for the first time.
func _ready():
	#player.global_position = player_spawn_pos.global_position
	audio_stream_player_2d.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered_signal(body, enemy):
	#if body.name == "Player":
	player.animated_sprite.play("hurt")
	pearl_game_manager.dec_health()


func _on_area_2d_body_entered(body):
	bubble_audio.play()
	pearl_game_manager.inc_health()
	var tween = get_tree().create_tween()
	tween.tween_property(bubble, "modulate:a", 0, 0.3)
	tween.tween_callback(bubble.queue_free)

@onready var parallax_background = $ParallaxBackground
@onready var anchor_audio_stream_player_2d = $ParallaxBackground/Anchor/AnchorAudioStreamPlayer2D


func _on_anchor_area_2d_body_entered(body):
	player.animated_sprite.play("idle")
	anchor_audio_stream_player_2d.play()
	player.XSPEED = 0
	player.YSPEED = 0
	parallax_background.scroll_offset = Vector2(0.01, 0.01)
	get_tree().change_scene_to_file("res://Overworld.tscn")


func _on_pearl_body_entered(body):
	pearl_game_manager.inc_pearls()
