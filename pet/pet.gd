extends Node2D

var windowpos
var mouseposx
var mouseposy


func _physics_process(delta: float) -> void:
	windowpos = get_window().position
	mouseposy = int(get_viewport().get_mouse_position()[1] / 4) * 4
	mouseposx = int(get_viewport().get_mouse_position()[0] / 4) * 4 
	if windowpos[1] - 215 < mouseposy:
		get_window().position[1] += 1
	if windowpos[1] - 215 > mouseposy:
		get_window().position[1] -= 4
	if windowpos[0] - 600 < mouseposx:
		get_window().position[0] += 4
	if windowpos[0] - 600 > mouseposx:
		get_window().position[0] -= 4
