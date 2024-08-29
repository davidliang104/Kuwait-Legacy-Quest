extends ScrollContainer

@onready var label = $Label
@export var scroll_speed: float = 50.0  # Pixels per second

var scroll_offset: Vector2 = Vector2.ZERO

func _ready():
	# Ensure the ScrollContainer's size is set properly
	#update_scrollbar()
	pass

func _process(delta: float):
	# Update the scroll offset based on scroll speed and delta time
	scroll_offset.y += scroll_speed * delta
	
	# Scroll by updating the scroll offset
	#scroll_to(Vector2(0, scroll_offset.y))
