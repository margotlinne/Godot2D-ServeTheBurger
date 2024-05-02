extends Control

@onready var anim = $"BG Color/AnimationPlayer"

var splash_done

func _ready():
	anim.play("rolling")
	
func _process(delta):
	if splash_done:
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
		


func _on_animation_player_animation_finished(anim_name):
	splash_done = true
