extends Node2D

var touching:bool
var headorbody:String
var grab:bool = false
var pet:bool = false
var mstartx = 0
var mstarty = 0
var meowcount:int = 0
var tween
var tweengoing:bool = false


func _process(_delta: float) -> void:
	if get_viewport().get_mouse_position()[0] > 200 \
	and get_viewport().get_mouse_position()[0] < 800 \
	and get_viewport().get_mouse_position()[1] < 900 \
	and get_viewport().get_mouse_position()[1] > 500:
		touching = true
		headorbody = "body"
	elif get_viewport().get_mouse_position()[0] > 200 \
	and get_viewport().get_mouse_position()[0] < 800 \
	and get_viewport().get_mouse_position()[1] < 400 \
	and get_viewport().get_mouse_position()[1] > 100:
		touching = true
		headorbody = "head"
	else:
		touching = false
	if touching == true:
		if Input.is_action_just_pressed("left") and headorbody == "body":
			grab = true
		if grab == false and headorbody == "body":
			Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)
		if Input.is_action_just_pressed("left") and headorbody == "head":
			pet = true
			$AudioStreamPlayer2D.play()
			meowcount += 1
			$counter.text = str(meowcount) + " "
			appear()
		if pet == false and headorbody == "head":
			Input.set_default_cursor_shape(Input.CURSOR_CAN_DROP)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	if Input.is_action_just_pressed("left") == true and headorbody == "body":
		mstartx = get_viewport().get_mouse_position()[0]
		mstarty = get_viewport().get_mouse_position()[1]
	if grab == true:
		Input.set_default_cursor_shape(Input.CURSOR_DRAG)
		get_window().position.x +=get_viewport().get_mouse_position()[0]/2 - mstartx/2
		get_window().position.y +=get_viewport().get_mouse_position()[1]/2 - mstarty/2
	if pet == true:
		Input.set_default_cursor_shape(Input.CURSOR_DRAG)
		$cat.frame = 1


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("left"):
		grab = false
		pet = false
		$cat.frame = 0


func appear():
	if tweengoing == true:
		tween.kill()
	$counter.modulate.a = 1.0
	tween = create_tween()
	tweengoing = true
	tween.tween_property($counter, "modulate:a", 0.0, 3.0)
	await tween.finished
	tweengoing = false
	print(tweengoing)
