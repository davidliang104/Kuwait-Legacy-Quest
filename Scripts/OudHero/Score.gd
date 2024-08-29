extends Label

@export var score: String = "D A A# C A# A G A"
@export var score_list: Array[String] = ["D","A","A#","C","A#","A","G","A"]
var state = 0
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	text = score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
