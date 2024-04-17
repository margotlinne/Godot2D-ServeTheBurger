extends Control

@onready var collectionBtn = $"Collection Panel/Collection Button"
@onready var settingBtn = $"Setting Panel/Setting sprite/Setting Button"
@onready var collection_canvas = $"Collection Canvas"

@onready var closedBook = $"Collection Panel/Book Sprite"
@onready var openBook = $"Collection Panel/OpenBook Sprite"


func _on_setting_button_pressed():
	pass # Replace with function body.


func _on_collection_button_pressed():
	collection_canvas.visible = on_off(collection_canvas.visible)
	closedBook.visible = on_off(closedBook.visible)
	openBook.visible = on_off(openBook.visible)
	
	if collection_canvas.visible:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1

		

func on_off(val):
	return not val
