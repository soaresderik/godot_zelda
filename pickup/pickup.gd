extends Area2D

export (bool) var disappears = false

func _ready():
	connect("body_entered", self, "body_entered")
	connect("area_entered", self, "area_entered")

func area_entered(area):
	var area_entered = area.get_parent()
	if area_entered.name == "sword":
		area.body_entered(area_entered.get_parent())
