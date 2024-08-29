extends Area2D

@export var speed := 50

signal body_entered_signal(body, enemy : Area2D)

func _physics_process(delta):
	global_position.x += -speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _on_body_entered(body):
	if body.name == "Player":
		body_entered_signal.emit(body, self)
		set_deferred("monitoring", false) 
