extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Reference to the AnimatedSprite3D node
var animated_sprite: AnimatedSprite3D

func _ready():
	# Get the AnimatedSprite3D node
	animated_sprite = $AnimatedSprite3D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Play the appropriate animation based on direction
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		if input_dir.y < 0:  # Moving forward (up arrow)
			animated_sprite.play("Forward_mov")
		elif input_dir.y > 0:  # Moving backward (down arrow)
			animated_sprite.play("Backward_mov")
		elif input_dir.x > 0:  # Moving right (right arrow)
			animated_sprite.flip_h = false
			animated_sprite.play("Side_mov")
		elif input_dir.x < 0:  # Moving left (left arrow)
			animated_sprite.flip_h = true
			animated_sprite.play("Side_mov")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		animated_sprite.stop()

	move_and_slide()
