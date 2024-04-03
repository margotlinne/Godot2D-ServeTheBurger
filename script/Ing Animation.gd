extends AnimationPlayer

var instance = null

func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()

func landed():
	play("ingredients_land")
