extends Control

@onready var audio_manager =get_node("/root/Node/Audio Manager")
@onready var collectionBtn = $"Collection Panel/Collection Button"
@onready var collection_canvas = $"Collection Canvas"

@onready var screen= $"Computer Panel/Computer screen"

@onready var player_area = get_node("/root/Node/Game/Left Hand/Detect Btn")

func _on_collection_button_pressed():
	if !Global.game_over && Global.game_start:
		print("pressed")
		audio_manager.audio.button_sound_play()
		collection_canvas.visible = on_off(collection_canvas.visible)
		if collection_canvas.visible:
			player_area.visible = false
			screen.modulate = Color(1,1,1,1)
		else: 
			player_area.visible = true
			screen.modulate = Color(0,0,0,1)
	
	if collection_canvas.visible:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1

		

func on_off(val):
	return not val
