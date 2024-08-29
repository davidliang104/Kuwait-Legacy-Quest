extends Area3D

var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		get_tree().change_scene_to_file("res://Scenes/Riddles/riddles.tscn")

func _on_body_entered(body: PhysicsBody3D):
	entered = true

	
func _on_body_exited(body):
	entered = false


func _on_area_entered(area):
	pass # Replace with function body.


func _on_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
