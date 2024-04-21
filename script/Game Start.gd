extends ColorRect



func _process(_delta):
	#print(Global.game_start)
	if Global.game_start:
		self.visible = false
	else:
		self.visible = true
