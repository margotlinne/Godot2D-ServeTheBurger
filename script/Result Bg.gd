extends Sprite2D

@onready var anim = $AnimationPlayer
var ready_newBurger = false

func sliding():
	anim.play("slide")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "slide":
		ready_newBurger = true
