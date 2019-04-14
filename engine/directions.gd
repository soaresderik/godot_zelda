extends Node

func rand():
	var d = randi() % 4 * 1
	match d:
		1:
			return Vector2.LEFT
		2: 
			return Vector2.RIGHT
		3:
			return Vector2.UP
		_: 
			return Vector2.DOWN