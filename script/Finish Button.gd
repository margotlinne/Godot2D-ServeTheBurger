extends Panel

@onready var anim = $AnimationPlayer

func _process(delta):
	if Global.score >= 5 && !Global.game_over:
		play_activated()
	else:
		play_idle()
		
func play_activated():
	anim.play("activated")
	
func play_idle():
	anim.play("idle")
