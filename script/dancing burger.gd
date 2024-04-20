extends Node2D

@onready var anim = $AnimationPlayer
func _process(delta):
	anim.play("idle")
