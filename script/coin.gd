extends Marker2D

var coin_obj = preload("res://scenes/coin.tscn")
var instance = null

func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func instantiate_coin(final_pos, gold):
	var ins_coin = coin_obj.instantiate()
	ins_coin.position = self.global_position
	get_parent().get_parent().add_child(ins_coin)
	
	
	var tween = create_tween()
	
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_interval(1)
	
	if gold:
		tween.tween_property(ins_coin, "modulate", Color.YELLOW, 0.1)
		tween.tween_property(ins_coin, "scale", Vector2(1.5,1.5), 0.1)
		
	ins_coin.set_z_index(0)
	tween.tween_property(ins_coin, "position", final_pos, 1.5).set_trans(Tween.TRANS_CUBIC)
	tween.tween_interval(1)
	tween.tween_property(ins_coin, "modulate:a", 0, 1)
	
