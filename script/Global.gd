extends Node


var score = 0
var game_over = false
var best_score = 0
var total_earning = 0
var total_made_burger = 0
var total_burgerWflower = 0
var total_burgerWstripe = 0
var total_burgerWbed = 0
var total_burgerWpan = 0
var game_start = false

var burger_count = []

const CollectionClass = preload("res://script/CollectionClass.gd")
const ShopClass = preload("res://script/Shop Class.gd")

var shop
var collection_ins

#var audio_scene = preload("res://scenes/sfx.tscn")
#var audio

@onready var root_node = get_node("/root/Node")
	
func _ready():	
	burger_count.append(total_made_burger)
	burger_count.append(total_burgerWflower)
	burger_count.append(total_burgerWstripe)
	burger_count.append(total_burgerWbed)
	burger_count.append(total_burgerWpan)
	
	collection_ins = CollectionClass.new()
	shop = ShopClass.new()
	
#	audio = audio_scene.instantiate()
#	root_node.add_child(audio)
#	print(audio.get_child_count())
#
#
#func button_sound_play():
#		audio.get_node("Button_AudioStreamPlayer2D").play()
#
#func right_hand_sound_play():
#	if audio != null:
#		audio.get_node("RightHand_AudioStreamPlayer2D").play()
#
#func hover_sound_play():
#	if audio != null:
#		audio.get_node("Hover_AudioStreamPlayer2D").play()
#
#func coin_sound_play():
#	if audio != null:
#		audio.get_node("Coin_AudioStreamPlayer2D").play()
#
#func drop_coin_sound_play():
#	if audio != null:
#		audio.get_node("DropCoin_AudioStreamPlayer2D").play()
#
#func coinTxt_sound_play():
#	if audio != null:
#		audio.get_node("CoinTxt_AudioStreamPlayer2D").play()
#
#func bell_sound_play():
#	if audio != null:
#		audio.get_node("Bell_AudioStreamPlayer2D").play()
#
#func gameover_sound_play():
#	if audio != null:
#		audio.get_node("GameOver_AudioStreamPlayer2D").play()
#
#func finish_burger_sound_play():
#	if audio != null:
#		audio.get_node("FinishBurger_AudioStreamPlayer2D").play()
#
#func serve_sound_play():
#	if audio != null:
#		audio.get_node("Serve_AudioStreamPlayer2D").play()
#
#func perfect_sound_play():
#	if audio != null:
#		audio.get_node("Perfect_AudioStreamPlayer2D").play()
#
#func stack_sound_play():
#	if audio != null:
#		audio.get_node("Stack_AudioStreamPlayer2D").play()
#
#func unlock_sound_play():
#	if audio != null:
#		audio.get_node("Unlock_AudioStreamPlayer2D").play()
