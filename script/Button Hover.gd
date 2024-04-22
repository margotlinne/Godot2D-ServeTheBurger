extends Control

@onready var audio_manager = get_node("/root/Menu/Audio Manager")

func _on_mouse_entered():
	audio_manager.audio.hover_sound_play()



func _on_how_to_play_button_mouse_entered():
	audio_manager.audio.hover_sound_play()



func _on_play_button_mouse_entered():
	audio_manager.audio.hover_sound_play()
