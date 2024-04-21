extends Control

@onready var howtoplay_canvas = $"How to play"

@onready var audio_manager = get_node("/root/Menu/Audio Manager")





func _on_play_button_pressed():
	audio_manager.audio.button_sound_play()
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_how_to_play_button_pressed():
	audio_manager.audio.button_sound_play()
	howtoplay_canvas.visible = on_off(howtoplay_canvas.visible)
	
func on_off(val):
	return not val
