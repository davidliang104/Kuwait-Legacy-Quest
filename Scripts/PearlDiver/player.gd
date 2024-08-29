extends CharacterBody2D


@export var XSPEED = 100.0
@export var YSPEED = 150.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not animated_sprite.is_playing():
		animated_sprite.play("swim")
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#print(direction)
	#if direction:
	position.x += XSPEED * delta #direction.x * SPEED
	velocity.y = direction.y * YSPEED
	#print(velocity.y)
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	#	velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


#func _on_area_2d_area_entered(area):
#	print("hurt")
#	animated_sprite.play("hurt")
