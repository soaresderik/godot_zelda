extends "res://engine/entity.gd"

var state = "default"
var keys = 0

func _ready():
	MAXHEALTH = 16
	health = MAXHEALTH
	TYPE = "PLAYER"

func _physics_process(delta):
	match state:
		"default":
			state_default()
		"swing":
			state_swing()
	keys = min(keys, 9)
	
func state_default():
	control_loop()
	movement_loop()
	spritedir_loop()
	damage_loop()
	
	if is_on_wall():
		if spritedir == "left" and test_move(transform, Vector2.LEFT):
			anim_switch("push")
		if spritedir == "right" and test_move(transform, Vector2.RIGHT):
			anim_switch("push")
		if spritedir == "up" and test_move(transform, Vector2.UP):
			anim_switch("push")
		if spritedir == "down" and test_move(transform, Vector2.DOWN):
			anim_switch("push")
	elif movedir != Vector2(0, 0):
		anim_switch("walk")
	else:
		anim_switch("idle")
		
	if Input.is_action_just_pressed("a"):
		use_item(preload("res://items/sword.tscn"))

func state_swing():
	anim_switch("idle")
	movement_loop()
	damage_loop()
	movedir = Vector2.ZERO

func control_loop():
	var LEFT   = Input.is_action_pressed("ui_left")
	var RIGHT  = Input.is_action_pressed("ui_right")
	var UP     = Input.is_action_pressed("ui_up")
	var DOWN   = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)