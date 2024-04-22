extends HBoxContainer

@onready var movement_anim = $movement
@onready var finish_anim = $finish
@onready var warning_anim = $warning

@onready var bg_music = get_node("/root/Menu/AudioStreamPlayer2D")
@onready var crowd_sfx = get_node("/root/Menu/AudioStreamPlayer2D/AudioStreamPlayer2D")

@onready var howtoplay_canvas = get_node("/root/Menu/How to play")
func _ready():
	bg_music.play()
	crowd_sfx.play()
func _process(delta):
	if howtoplay_canvas.visible:
		warning_anim.play("warning")
		movement_anim.play("movement")
		finish_anim.play("finish")
