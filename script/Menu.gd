extends Control

@onready var howtoplay_canvas = $"How to play"







func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_how_to_play_button_pressed():
	howtoplay_canvas.vsible = true
