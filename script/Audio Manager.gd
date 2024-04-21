extends Node2D

const sfx = preload("res://scenes/sfx.tscn")
var audio

func _ready():
	audio = sfx.instantiate()
	add_child(audio)
