extends Control

@onready var audio_manager = get_node("/root/Node/Audio Manager")

@onready var first_page = $ColorRect/Computer/CollectionPage/HBoxContainer
@onready var second_page = $ColorRect/Computer/CollectionPage/HBoxContainer2
@onready var third_page = $ColorRect/Computer/CollectionPage/HBoxContainer3

@onready var rightBtn = $"ColorRect/Computer/CollectionPage/Right Button"
@onready var leftBtn = $"ColorRect/Computer/CollectionPage/Left Button"

@onready var shop_page = $ColorRect/Computer/ShopPage/HBoxContainer4
@onready var collection_page = $ColorRect/Computer/CollectionPage
@onready var setting_page = $ColorRect/Computer/SettingPage/HBoxContainer

@onready var shopBtn = $"ColorRect/Computer/Shop Button"
@onready var collectionBtn = $ColorRect/Computer/CollectionButton
@onready var settingBtn = $ColorRect/Computer/SettingButton

@onready var onion_req = $ColorRect/Computer/CollectionPage/HBoxContainer/Control/VBoxContainer/onion/Lock/HBoxContainer/Control/Label
@onready var onion_lock = $ColorRect/Computer/CollectionPage/HBoxContainer/Control/VBoxContainer/onion/Lock
@onready var tomato_req = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/tomato/Lock/HBoxContainer/Control/Label
@onready var tomato_lock = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/tomato/Lock
@onready var chickencutlet_req = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/chickencutlet/Lock/HBoxContainer/Control/Label
@onready var chickencutlet_lock = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/chickencutlet/Lock
@onready var pickle_req = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/pickle/Lock/HBoxContainer/Control/Label
@onready var pickle_lock = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/pickle/Lock
@onready var shrimp_req = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/shrimp/Lock/HBoxContainer/Control/Label
@onready var shrimp_lock = $ColorRect/Computer/CollectionPage/HBoxContainer/Control2/VBoxContainer/shrimp/Lock
@onready var bacon_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/bacon/Lock/HBoxContainer/Control/Label
@onready var bacon_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/bacon/Lock
@onready var greenonion_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/greenonion/Lock/HBoxContainer/Control/Label
@onready var greenonion_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/greenonion/Lock
@onready var lemon_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/lemon/Lock/HBoxContainer/Control/Label
@onready var lemon_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/lemon/Lock
@onready var fish_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/fish/Lock/HBoxContainer/Control/Label
@onready var fish_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control/VBoxContainer/fish/Lock
@onready var drumstick_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/drumstick/Lock/HBoxContainer/Control/Label
@onready var drumstick_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/drumstick/Lock
@onready var flower_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/flower/Lock/HBoxContainer/Control/Label
@onready var flower_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/flower/Lock
@onready var spicysauce_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/spicysauce/Lock/HBoxContainer/Control/Label
@onready var spicysauce_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/spicysauce/Lock
@onready var mayonnaise_req = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/mayonnaise/Lock/HBoxContainer/Control/Label
@onready var mayonnaise_lock = $ColorRect/Computer/CollectionPage/HBoxContainer2/Control2/VBoxContainer/mayonnaise/Lock
@onready var pineapple_req = $ColorRect/Computer/CollectionPage/HBoxContainer3/Control/VBoxContainer/pineapple/Lock/HBoxContainer/Control/Label
@onready var pineapple_lock = $ColorRect/Computer/CollectionPage/HBoxContainer3/Control/VBoxContainer/pineapple/Lock

@onready var achievement_box = $"../Achievement/Panel"
@onready var ing_manager = get_node("/root/Node/Game")
@onready var parent = $"../Achievement"
var current_page = 1


var req = []
var lock = []

var box_ins = []


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
	

	
	update_requirement_label()
	update_btn()
	_update_btn_color()
	
func _process(delta):
	var count = 0
	# onion
	if ing_manager.clean && Global.score >= 20:
		achievement_appear(0)
	# tomato
	if Global.burger_count[0] == 10:
		achievement_appear(1)
	# chickencutlet
	for i in ing_manager.history.size():
		if i != ing_manager.history.size() - 1:
			if ing_manager.history[i] >= 10:
				if ing_manager.history[i + 1] >= 10:
					achievement_appear(2)
	# pickle
	if Global.burger_count[0] == 30:
		achievement_appear(3)
	# shrimp
	if Global.total_earning >= 5000:
		achievement_appear(4)
	# bacon
	if Global.total_earning >= 15000:
		achievement_appear(4)
	# greenonion
	for i in Global.collection_ins.collection.size():
		if Global.collection_ins.collection[i].unlock:
			count += 1
			continue
		if count == 2:
			achievement_appear(6)
			count = 0
			break
	# lemon
	for i in Global.shop.shop.size():
		if Global.shop.shop[i].sold:
			count += 1
		if count == 2:
			achievement_appear(7)
			count = 0
			break
	# fish
	if Global.total_earning >= 50000:
		achievement_appear(8)
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
		
	for i in box_ins.size():
		if box_ins[i].done && box_ins[i] != null:
			if i == box_ins.size() - 1:
				box_ins.clear()
		
	
func achievement_appear(index):
	if !Global.collection_ins.collection[index + 3].unlock:
		audio_manager.audio.unlock_sound_play()
		var new_ins = achievement_box.duplicate()
		var count = 0
		new_ins.index = index
		parent.add_child(new_ins)
		box_ins.append(new_ins)
		
		# if there's a achievement box appeared already, so it's 2 including this one
		for i in box_ins.size():
			#print(box_ins[i].done, "   ", box_ins[i].img[box_ins[i].index])
			if !box_ins[i].done:
				if i == box_ins.size() - 1:
					count = i
				else: count += 1
			else: 
				# this was the point!
				box_ins[i] = new_ins
				count = i
				break
		#print(count)
		new_ins.position = Vector2(0, -40 * count)
		new_ins.visible = true
		Global.collection_ins.collection[index + 3].unlock = true
		new_ins.detail_txt.text = req[index].text
		SaveLoad.save_collection()
		for i in new_ins.img.size():
			if i != index:
				new_ins.img[i].visible = false
			else:
				new_ins.img[i].visible = true
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(new_ins, "modulate:a", 1, 0.5)
		tween.tween_property(new_ins, "position", Vector2(0, new_ins.position.y - 10), 0.4)
		tween.tween_property(new_ins, "position", Vector2(0, new_ins.position.y), 0.4)
		tween.tween_interval(2)
		tween.tween_property(new_ins, "modulate:a", 0, 0.5)
		await get_tree().create_timer(4).timeout
		new_ins.done = true

	
		
func update_requirement_label():
	onion_req.text = "Serve over 20 layers burger to unlock."
	tomato_req.text = "Serve 10 burgers to unlock." 
	chickencutlet_req.text = "Serve over 10 layers burger in a row." 
	pickle_req.text = "Serve 30 burgers to unlock." 
	shrimp_req.text = "Earn 5,000 coins." 
	bacon_req.text = "Earn 15,000 coins." 
	greenonion_req.text = "Unlock 5 ingredients." 
	lemon_req.text = "Buy 2 plates." 
	fish_req.text = "Earn 50,000 coins" 
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
	
		
		
func _on_right_button_pressed():
	audio_manager.audio.button_sound_play()
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
	audio_manager.audio.button_sound_play()
	if current_page == 2:
		second_page.visible = false
		first_page.visible = true
		current_page -= 1
	elif current_page == 3:
		third_page.visible = false
		second_page.visible = true
		current_page -= 1
	update_btn()

func _update_btn_color():
	if shop_page.visible:
		shopBtn.self_modulate = Color(1, 1, 1, 1)
		collectionBtn.self_modulate = Color(0.8, 0.8, 0.8, 0.8)
		settingBtn.self_modulate = Color(0.8, 0.8, 0.8, 0.8)
	if collection_page.visible:
		collectionBtn.self_modulate = Color(1, 1, 1, 1)
		shopBtn.self_modulate= Color(0.8, 0.8, 0.8, 0.8)
		settingBtn.self_modulate = Color(0.8, 0.8, 0.8, 0.8)
	if setting_page.visible:
		settingBtn.self_modulate = Color(1, 1, 1, 1)
		shopBtn.self_modulate= Color(0.8, 0.8, 0.8, 0.8)	
		collectionBtn.self_modulate = Color(0.8, 0.8, 0.8, 0.8)
		
		
func _on_shop_button_pressed():	
	audio_manager.audio.button_sound_play()
	if shop_page.visible:
		pass
	else:
		shop_page.visible = true
		collection_page.visible = false
		setting_page.visible = false
	_update_btn_color()
	
func _on_collection_button_pressed():
	audio_manager.audio.button_sound_play()
	if collection_page.visible:
		pass
	else:
		collection_page.visible = true
		shop_page.visible = false
		setting_page.visible = false
	_update_btn_color()

func _on_setting_button_pressed():
	audio_manager.audio.button_sound_play()
	if setting_page.visible:
		pass
	else:
		setting_page.visible = true
		shop_page.visible = false
		collection_page.visible = false
	_update_btn_color()

func _on_test_1_pressed():
	achievement_appear(0)


func _on_test_2_pressed():
	achievement_appear(1)


func _on_test_3_pressed():
	achievement_appear(2)


func _on_test_4_pressed():
	achievement_appear(3)

func _on_test_5_pressed():
	achievement_appear(4)




