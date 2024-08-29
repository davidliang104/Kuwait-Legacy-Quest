extends Sprite2D

@onready var pearl_game_manager = %PearlGameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += -30 * delta


func _on_area_2d_body_entered(body):
	pearl_game_manager.inc_health()
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.5)
	tween.tween_callback(queue_free)
