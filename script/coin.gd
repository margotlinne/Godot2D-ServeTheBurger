extends Marker2D

var coin_obj = preload("res://scenes/coin.tscn")
var instance = null

@onready var audio_manager = get_node("/root/Node/Audio Manager")

func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()
		



func instantiate_coin(final_pos, blue, gold):
	audio_manager.audio.drop_coin_sound_play()
	var ins_coin = coin_obj.instantiate()
	ins_coin.position = self.global_position
	get_parent().get_parent().add_child(ins_coin)
	
	
	var tween = create_tween()
	
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_interval(1)
	
	if gold:
		ins_coin.modulate = Color.LIGHT_GOLDENROD
		ins_coin.scale = Vector2(1.5,1.5)
		ins_coin.modulate = Color.SKY_BLUE
		ins_coin.scale = Vector2(1.3,1.3)
	tween.tween_property(ins_coin, "position", final_pos, 1.5).set_trans(Tween.TRANS_CUBIC)
	await tween.finished
	audio_manager.audio.coin_sound_play()
	tween.tween_interval(1)
	tween.tween_property(ins_coin, "modulate:a", 0, 1)
	ins_coin.set_z_index(0)
	
