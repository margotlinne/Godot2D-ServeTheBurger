extends ColorRect

@onready var label_anim = $"start by clicking/AnimationPlayer"

func _process(_delta):
	#print(Global.game_start)	
	if Global.game_start:
		label_anim.stop()
		self.visible = false
	else:
		label_anim.play("idle")
		self.visible = true
