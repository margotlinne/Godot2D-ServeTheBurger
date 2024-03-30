extends Control


@onready var optionCanvas = get_node("/root/Menu/Option")

func _on_play_btn_pressed():
	get_tree().change_scene_to_file("res://game.tscn")



func _on_exit_btn_pressed():
	get_tree().quit()


func _on_option_btn_pressed():
	optionCanvas.visible = true


func _on_back_to_menu_btn_pressed():
	optionCanvas.visible = false
