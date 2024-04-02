extends RigidBody2D

@onready var player = get_node("/root/Node/Game")
var landed = false
var middle = false

func _on_body_entered(body):
	if body.is_in_group("ingredient"):
		landed = true
	if body.is_in_group("center"):
		middle = true
	if body.is_in_group("deleted"):
		player.game_over = true
