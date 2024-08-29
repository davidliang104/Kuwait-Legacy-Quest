extends Label

@onready var pearl_game_manager = %PearlGameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "HEALTH: " + str(pearl_game_manager.health) + "\nPEARLS: " + str(pearl_game_manager.pearls) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
