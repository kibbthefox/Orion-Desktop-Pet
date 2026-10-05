extends Node2D

var touching:bool
var grab:bool = false


func _process(_delta: float) -> void:
	#    pick up
	if get_viewport().get_mouse_position()[0] > 200 \
	and get_viewport().get_mouse_position()[0] < 800 \
	and get_viewport().get_mouse_position()[1] < 900 \
	and get_viewport().get_mouse_position()[1] > 500:
		touching = true
	elif get_viewport().get_mouse_position()[0] < 198 \
	and get_viewport().get_mouse_position()[0] > 802 \
	and get_viewport().get_mouse_position()[1] > 902 \
	and get_viewport().get_mouse_position()[1] < 498:
		touching = false
	if touching == true:
		if Input.is_action_just_pressed("left"):
			grab = true
		if Input.is_action_just_released("left"):
			grab = false
		if grab == false:
			Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)
		else:
			Input.set_default_cursor_shape(Input.CURSOR_DRAG)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		



#
#func _physics_process(_delta: float) -> void:
	#windowpos = get_window().position
	#mouseposy = int(get_viewport().get_mouse_position()[1] / 4) * 4
	#mouseposx = int(get_viewport().get_mouse_position()[0] / 4) * 4 
	#if windowpos[1] - 215 < mouseposy:
		#get_window().position[1] += 1
	#if windowpos[1] - 215 > mouseposy:
		#get_window().position[1] -= 4
	#if windowpos[0] - 600 < mouseposx:
		#get_window().position[0] += 4
	#if windowpos[0] - 600 > mouseposx:
		#get_window().position[0] -= 4
