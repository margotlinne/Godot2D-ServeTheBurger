extends MarginContainer

var self_opened = false

@onready var equipCanvas = get_node("/root/Menu/Equip")

func _on_button_pressed():
	self_opened = !self_opened
	if self_opened:
		equipCanvas.visible = true
	else:
		equipCanvas.visible = false
