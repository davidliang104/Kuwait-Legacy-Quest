extends Area3D

var entered = false
var dialogue_triggered = false  # Ensure the dialogue is only triggered once

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered and dialogue_triggered == false:
		DialogueManager.show_dialogue_balloon(load("res://dialogue/main.dialogue"), "oudman")
		entered = true
		dialogue_triggered = true

func _on_body_entered(body: PhysicsBody3D):
	entered = true

	
func _on_body_exited(body):
	get_tree().change_scene_to_file("res://Scenes/OudHero/oud_hero.tscn")
	entered = false
	dialogue_triggered
