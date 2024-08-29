extends Node

var health = 3
var pearls = 0
@onready var label = $"../CanvasLayer/Label"


func dec_health():
	health -= 1
	print(health)
	label.text = "HEALTH: " + str(health) + "\nPEARLS: " + str(pearls)
	if health == 0:
		get_tree().reload_current_scene()
	
func inc_health():
	health += 1
	print(health)
	label.text = "HEALTH: " + str(health) + "\nPEARLS: " + str(pearls)
	
func inc_pearls():
	pearls += 1
	label.text = "HEALTH: " + str(health) + "\nPEARLS: " + str(pearls)
