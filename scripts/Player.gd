extends Node2D

onready var animation = $Animation
var center
var offset
var game
var right = true

func _ready():
	game = get_parent()
	center = get_viewport_rect().size.x / 2
	offset = abs(position.x - center)
	
func _input(event):
	if (event is InputEventMouseButton or 
	event is InputEventScreenTouch ) and event.is_pressed():
	# player clicked left of the screen
		if event.position.x < center:
			position.x = center - offset
			scale.x = -abs(scale.x)
			right = false
		else:
			position.x = center + offset	
			scale.x = abs(scale.x)
			right = true
		animation.play("punch");
		game.punch_tree(right)