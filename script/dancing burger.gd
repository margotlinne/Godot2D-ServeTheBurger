extends Control

@onready var anim = $AnimationPlayer
func _process(delta):
	anim.play("idle")
