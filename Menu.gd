extends Control




func _on_play_btn_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_options_btn_pressed():
	pass # Replace with function body.


func _on_exit_btn_pressed():
	get_tree().quit()
