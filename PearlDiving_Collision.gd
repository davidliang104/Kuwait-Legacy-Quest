extends Area3D

var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		get_tree().change_scene_to_file("res://Scenes/PearlDiving/pearl_diving.tscn")

func _on_body_entered(body: PhysicsBody3D):
	entered = true

	
func _on_body_exited(body):
	entered = false
