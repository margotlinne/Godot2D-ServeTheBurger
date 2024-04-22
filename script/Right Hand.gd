extends Control

@onready var hand = get_node("/root/Node/Game/Right Hand/Move")
@onready var anim = $AnimationPlayer
# 이동 속도
var move_speed = 300
# 이동 방향 (1: 오른쪽, -1: 왼쪽)
var move_direction = -1
var instance = null
var disappear = false

var moving = false
var loosing_power = false

var window_width = 0
var left_edge = 0

func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()
	
	set_default()
		
func _process(delta):
	#print(hand.position)
	var left_gap = int(hand.position.x) - left_edge
	var right_gap = int(hand.position.x)
	
	# I initiated value when it's decalred, 
	# so the window_width size was the same even though window size is resized.
	window_width = get_viewport().size.x
	left_edge = (window_width * -1) + 60


	if !moving:
		hand.position = hand.position
		if disappear:
			anim.play("fading")
			disappear = false
	else:
		hand.position.x += move_speed * move_direction * delta
		if move_direction == -1 && left_gap >= 0 && left_gap <= 5:		
			move_direction *= -1
		if move_direction == 1 && right_gap >= 0 && right_gap <= 5:
			move_direction *= -1
		anim.play("loosing")
	
		
func set_default():
	hand.position = Vector2(63, -153)
	
func move_hand():
	moving = true



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fading":
		anim.play("idle")
		set_default()
		
	if anim_name == "loosing" && moving:
		print("lose power")
		moving = false
		loosing_power = true
		#set_default()
