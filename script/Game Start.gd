extends ColorRect



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(Global.game_start)
	if Global.game_start:
		self.visible = false
	else:
		self.visible = true
