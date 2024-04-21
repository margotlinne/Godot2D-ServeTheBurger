extends Sprite2D

@onready var anim = $AnimationPlayer
var ready_newBurger = false

func sliding():
	Global.serve_sound_play()
	anim.play("slide")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "slide":
		ready_newBurger = true
