extends Node2D

var riddler_value = -1
var riddle_answer := ["", "DATE", "DEAD"]
var solving = false
@onready var input_box = $CanvasLayer/InputBox
@onready var player = $Player
@onready var wheel_sprite = $WheelSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.solved_riddles = [true, false, false]


func _physics_process(delta):
	if riddler_value >= 0 and Input.is_action_just_pressed("interact") and not solving:
		match riddler_value:
			0:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/riddles.dialogue"), "riddle_master")
			1:
			
			 
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/riddles.dialogue"), "riddler1")
				if GameState.solved_riddles[1] == false:
					input_box.line_edit.text = ""
					input_box.line_edit.placeholder_text = "- - - -"
					input_box.visible = true
					player.current_speed = 0
					player.movable = false
					solving = true
			2:
				DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/riddles.dialogue"), "riddler2")
				if GameState.solved_riddles[2] == false:
					input_box.line_edit.text = ""
					input_box.line_edit.placeholder_text = "- - - - - -"
					input_box.visible = true
					player.current_speed = 0
					player.movable = false
					solving = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	print("area entered")
	if area.has_method("riddler"):
		riddler_value = area.riddler()
		print("near riddler: " + str(riddler_value))


func _on_area_2d_area_exited(area):
	#print("area exited")
	if area.has_method("riddler"):
		riddler_value = -1
		print("near riddler: " + str(riddler_value))

func _input(event):
	if event is InputEventKey and Input.is_action_just_pressed("enter") and solving:
		var player_input = input_box.get_node("LineEdit").text
		print(player_input)
		print(riddle_answer[riddler_value])
		player.current_speed = player.SPEED
		player.movable = true
		input_box.visible = false
		input_box.line_edit.text = ""
		solving = false
		if (player_input.to_lower() == riddle_answer[riddler_value].to_lower()):
			GameState.solved_riddles[riddler_value] = true
			if (GameState.solved_riddles[1] == true and GameState.solved_riddles[2]==true):
				GameState.solved_all_riddles = true
				wheel_sprite.visible = false
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/riddles.dialogue"), "riddler_correct")
		else:
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/riddles.dialogue"), "riddler_incorrect")


func _exit_area_entered(area):
	get_tree().change_scene_to_file("res://Overworld.tscn")
