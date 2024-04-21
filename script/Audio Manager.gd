extends Node2D

var instance
func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()

func button_sound_play():
	if self != null:
		get_node("Button_AudioStreamPlayer2D").play()
	
func right_hand_sound_play():
	if self != null:
		get_node("RightHand_AudioStreamPlayer2D").play()

func hover_sound_play():
	if self != null:
		get_node("Hover_AudioStreamPlayer2D").play()
	
func coin_sound_play():
	if self != null:
		get_node("Coin_AudioStreamPlayer2D").play()
	
func drop_coin_sound_play():
	if self != null:
		get_node("DropCoin_AudioStreamPlayer2D").play()
	
func coinTxt_sound_play():
	if self != null:
		get_node("CoinTxt_AudioStreamPlayer2D").play()

func bell_sound_play():
	if self != null:
		get_node("Bell_AudioStreamPlayer2D").play()

func gameover_sound_play():
	if self != null:
		get_node("GameOver_AudioStreamPlayer2D").play()
	
func finish_burger_sound_play():
	if self != null:
		get_node("FinishBurger_AudioStreamPlayer2D").play()
	
func serve_sound_play():
	if self != null:
		get_node("Serve_AudioStreamPlayer2D").play()
	
func perfect_sound_play():
	if self != null:
		get_node("Perfect_AudioStreamPlayer2D").play()
	
func stack_sound_play():
	if self != null:
		get_node("Stack_AudioStreamPlayer2D").play()
	
func unlock_sound_play():
	if self != null:
		get_node("Unlock_AudioStreamPlayer2D").play()

