extends Control


@onready var first_page = $ColorRect/Book/HBoxContainer
@onready var second_page = $ColorRect/Book/HBoxContainer2
@onready var third_page = $ColorRect/Book/HBoxContainer3
@onready var shop_page = $ColorRect/Book/HBoxContainer4

@onready var rightBtn = $"ColorRect/Book/Right Button"
@onready var leftBtn = $"ColorRect/Book/Left Button"

@onready var onion_req = $ColorRect/Book/HBoxContainer/Control/VBoxContainer/onion/Lock/HBoxContainer/Control/Label
@onready var onion_lock = $ColorRect/Book/HBoxContainer/Control/VBoxContainer/onion/Lock
@onready var tomato_req = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/tomato/Lock/HBoxContainer/Control/Label
@onready var tomato_lock = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/tomato/Lock
@onready var chickencutlet_req = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/chickencutlet/Lock/HBoxContainer/Control/Label
@onready var chickencutlet_lock = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/chickencutlet/Lock
@onready var pickle_req = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/pickle/Lock/HBoxContainer/Control/Label
@onready var pickle_lock = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/pickle/Lock
@onready var shrimp_req = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/shrimp/Lock/HBoxContainer/Control/Label
@onready var shrimp_lock = $ColorRect/Book/HBoxContainer/Control2/VBoxContainer/shrimp/Lock
@onready var bacon_req = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/bacon/Lock/HBoxContainer/Control/Label
@onready var bacon_lock = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/bacon/Lock
@onready var greenonion_req = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/greenonion/Lock/HBoxContainer/Control/Label
@onready var greenonion_lock = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/greenonion/Lock
@onready var lemon_req = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/lemon/Lock/HBoxContainer/Control/Label
@onready var lemon_lock = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/lemon/Lock
@onready var fish_req = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/fish/Lock/HBoxContainer/Control/Label
@onready var fish_lock = $ColorRect/Book/HBoxContainer2/Control/VBoxContainer/fish/Lock
@onready var drumstick_req = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/drumstick/Lock/HBoxContainer/Control/Label
@onready var drumstick_lock = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/drumstick/Lock
@onready var flower_req = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/flower/Lock/HBoxContainer/Control/Label
@onready var flower_lock = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/flower/Lock
@onready var spicysauce_req = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/spicysauce/Lock/HBoxContainer/Control/Label
@onready var spicysauce_lock = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/spicysauce/Lock
@onready var mayonnaise_req = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/mayonnaise/Lock/HBoxContainer/Control/Label
@onready var mayonnaise_lock = $ColorRect/Book/HBoxContainer2/Control2/VBoxContainer/mayonnaise/Lock
@onready var pineapple_req = $ColorRect/Book/HBoxContainer3/Control/VBoxContainer/pineapple/Lock/HBoxContainer/Control/Label
@onready var pineapple_lock = $ColorRect/Book/HBoxContainer3/Control/VBoxContainer/pineapple/Lock


@onready var onion_img = $"../Achievement/Panel/HBoxContainer/Image Control/onion"
@onready var tomato_img = $"../Achievement/Panel/HBoxContainer/Image Control/tomato"
@onready var chickencutlet_img = $"../Achievement/Panel/HBoxContainer/Image Control/chickencutlet"
@onready var pickle_img = $"../Achievement/Panel/HBoxContainer/Image Control/pickle"
@onready var shrimp_img = $"../Achievement/Panel/HBoxContainer/Image Control/shrimp"
@onready var bacon_img = $"../Achievement/Panel/HBoxContainer/Image Control/bacon"
@onready var greenonion_img = $"../Achievement/Panel/HBoxContainer/Image Control/greenonion"
@onready var lemon_img = $"../Achievement/Panel/HBoxContainer/Image Control/lemon"
@onready var fish_img = $"../Achievement/Panel/HBoxContainer/Image Control/fish"
@onready var drumstick_img = $"../Achievement/Panel/HBoxContainer/Image Control/drumstick"
@onready var flower_img = $"../Achievement/Panel/HBoxContainer/Image Control/flower"
@onready var spicysauce_img = $"../Achievement/Panel/HBoxContainer/Image Control/spicysauce"
@onready var mayonnaise_img = $"../Achievement/Panel/HBoxContainer/Image Control/mayonnaise"
@onready var pineapple_img = $"../Achievement/Panel/HBoxContainer/Image Control/pineapple"


@onready var detail_txt = $"../Achievement/Panel/HBoxContainer/Label Control/VBoxContainer/Detail Label Control/Label"

@onready var achievement_box = $"../Achievement/Panel"
@onready var ing_manager = get_node("/root/Node/Game")

var current_page = 1
var shop_open = false

var req = []
var lock = []
var img = []

func _ready():
	req.append(onion_req)
	req.append(tomato_req)
	req.append(chickencutlet_req)
	req.append(pickle_req)
	req.append(shrimp_req)
	req.append(bacon_req)
	req.append(greenonion_req)
	req.append(lemon_req)
	req.append(fish_req)
	req.append(drumstick_req)
	req.append(flower_req)
	req.append(spicysauce_req)
	req.append(mayonnaise_req)
	req.append(pineapple_req)
	
	lock.append(onion_lock)
	lock.append(tomato_lock)
	lock.append(chickencutlet_lock)
	lock.append(pickle_lock)
	lock.append(shrimp_lock)
	lock.append(bacon_lock)
	lock.append(greenonion_lock)
	lock.append(lemon_lock)
	lock.append(fish_lock)
	lock.append(drumstick_lock)
	lock.append(flower_lock)
	lock.append(spicysauce_lock)
	lock.append(mayonnaise_lock)
	lock.append(pineapple_lock)
	
	img.append(onion_img)
	img.append(tomato_img)
	img.append(chickencutlet_img)
	img.append(pickle_img)
	img.append(shrimp_img)
	img.append(bacon_img)
	img.append(greenonion_img)
	img.append(lemon_img)
	img.append(fish_img)
	img.append(drumstick_img)
	img.append(flower_img)
	img.append(spicysauce_img)
	img.append(mayonnaise_img)
	img.append(pineapple_img)
	
	update_requirement_label()
	
	
	update_btn()
	
func _process(delta):
	# onion
	if ing_manager.clean && Global.score >= 20:
		achievement_appear(0)
	# tomato
	if Global.burger_count[0] == 10:
		achievement_appear(1)
	# chickencutlet
	
	# pickle
	if Global.burger_count[0] == 30:
		achievement_appear(3)
	# shrimp
	
	# bacon
	
	# greenonion
	
	# lemon
	
	# fish
	
	# drumstick
	if Global.burger_count[0] == 500:
		achievement_appear(9)
	# flower
	if Global.burger_count[1] == 100:
		achievement_appear(10)
	# spicysauce
	if Global.burger_count[2] == 100:
		achievement_appear(11)
	# mayonnaise
	if Global.burger_count[3] == 50:
		achievement_appear(12)
	# pineapple
	if Global.burger_count[4] == 10:
		achievement_appear(13)
		
	for i in lock.size():
		if Global.collection_ins.collection[i + 3].unlock:
			lock[i].visible = false
		else: lock[i].visible = true
	
func achievement_appear(index):
	if !Global.collection_ins.collection[index + 3].unlock:
		achievement_box.visible = true
		Global.collection_ins.collection[index + 3].unlock = true
		detail_txt.text = req[index].text
		SaveLoad.save_collection()
		for i in img.size():
			if i != index:
				img[i].visible = false
			else:
				img[i].visible = true
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(achievement_box, "modulate:a", 1, 0.5)
		tween.tween_property(achievement_box, "position", Vector2(0, -10), 0.4)
		tween.tween_property(achievement_box, "position", Vector2(0, 0), 0.4)
		tween.tween_interval(2)
		tween.tween_property(achievement_box, "modulate:a", 0, 0.5)
	

func update_requirement_label():
	onion_req.text = "Serve over 20 layers burger to unlock."
	tomato_req.text = "Serve 10 burgers to unlock." 
	chickencutlet_req.text = "Serve over 10 layers burger in a row." 
	pickle_req.text = "Serve 30 burgers to unlock." 
	shrimp_req.text = "Unlock: " 
	bacon_req.text = "Unlock: " 
	greenonion_req.text = "Unlock: " 
	lemon_req.text = "Unlock: " 
	fish_req.text = "Unlock: " 
	drumstick_req.text = "Serve 500 burgers to unlock" 
	flower_req.text = "Serve 100 burgers with flower plate to unlock" 
	spicysauce_req.text = "Serve 100 burgers with stripe plate to unlock" 
	mayonnaise_req.text = "Serve 50 burger with bed plate to unlock" 
	pineapple_req.text = "Serve 10 burgers with Pan plate to unlock." 


func update_btn():
	if first_page.visible == true:
		leftBtn.visible = false
		rightBtn.visible = true
	elif third_page.visible == true:
		leftBtn.visible = true
		rightBtn.visible = false
	else:
		leftBtn.visible = true
		rightBtn.visible = true
	
	if shop_open:
		leftBtn.visible = false
		rightBtn.visible = false
		
		
func _on_right_button_pressed():
	if current_page == 1:
		first_page.visible = false
		second_page.visible = true
		current_page += 1
	elif current_page == 2:
		second_page.visible = false
		third_page.visible = true
		current_page += 1
	update_btn()


func _on_left_button_pressed():
	if current_page == 2:
		second_page.visible = false
		first_page.visible = true
		current_page -= 1
	elif current_page == 3:
		third_page.visible = false
		second_page.visible = true
		current_page -= 1
	update_btn()


func _on_shop_button_pressed():
	shop_open = not shop_open
	update_btn()
	shop_page.visible = not shop_page.visible
	
