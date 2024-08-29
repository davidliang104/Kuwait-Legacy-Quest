extends CharacterBody2D

const SPEED = 300
var current_speed = 300.0
var movable = true
@onready var animated_sprite_2d = $AnimatedSprite2D


func _ready():
	pass # Replace with function body.

var dir = 0

func _physics_process(delta):
#
	var vel = Vector2.ZERO
	if not movable:
		pass
	elif Input.is_action_pressed("move_down"):
		#vel.x += 1
		velocity = Vector2(0, current_speed)
		dir = 1
		animated_sprite_2d.play("walk_forward")
	elif Input.is_action_pressed("move_up"):
		#vel.y -= 1 #* current_speed
		velocity = Vector2(0, -current_speed)
		dir = 3
		animated_sprite_2d.play("walk_backward")
		
	elif Input.is_action_pressed("move_right"):
		#position.x += 1 #* current_speed
		#vel.x += 1
		velocity = Vector2(current_speed, 0)
		dir = 0
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("walk_right")
	elif Input.is_action_pressed("move_left"):
		#print("left")
		#vel.x -= 1 #* current_speed
		velocity = Vector2(-current_speed, 0)
		dir = 2
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("walk_right")
	#
	else:
		velocity = Vector2(0, 0)
		if movable:
			match dir:
				0:
					animated_sprite_2d.play("idle_right")
				1:
					animated_sprite_2d.play("idle_forward")
				2:
					animated_sprite_2d.play("idle_left")
				3:
					animated_sprite_2d.play("idle_backward")
				
	
	move_and_slide()
