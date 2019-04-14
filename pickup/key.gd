extends "res://pickup/pickup.gd"

func body_entered(body):
	if body.name == "player" and body.get("keys") < 9:
		body.keys += 1
		queue_free()
