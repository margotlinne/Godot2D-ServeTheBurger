extends Control

@onready var audio_manager = get_node("/root/Node/Audio Manager")

var instance = null

var ingredients = []
var array_length = 0
var random_index = 0

var history = []

# instantiated items
var ins_ingredient = []
# itmes landed on plate or ingredient
var stacked_ing = []
# instantiate interval
var timer = 0
const interval = 2

var finish_pause = false
var frozen = false
var clean = false
var finishing = false
var new_burger = false
var isOver = false
var total_perfect = 0
var total_burger = 0

var zooming = false
var stacked_items = 0

var reached_limit = false


@onready var canvas = get_node("/root/Node/Ingredient")
@onready var hand = get_node("/root/Node/Game/Left Hand")
@onready var plate = get_node("/root/Node/Game/Left Hand/Player Plate/Stack Pos")
@onready var right_hand = get_node("/root/Node/Game/Right Hand")

# result
@onready var last_pos = get_node("/root/Node/Game/Right Hand/Move/Hand Sprite/Last Bun Pos")
@onready var result = get_node("/root/Node/Hamburger/BG/Plate/Result Spawn Pos")
@onready var result_manager = get_node("/root/Node/Hamburger/BG")



# first and start object
var last_bun = preload("res://scenes/top bun.tscn")
var start_bun = preload("res://scenes/start bun.tscn")

# total earned coin in one game
var current_earning = 0
# saved earning till finish one burger
var save_earning = 0

# UI
@onready var earned_coinTxt = get_node("/root/Node/Game/UI/Score Panel/Earned coin")
@onready var coinTxt = get_node("/root/Node/Game/UI/Money Panel/Coin Text")
@onready var moneyJar = get_node("/root/Node/Game/UI/Money Panel/Coin Dest Pos")

# Aniamtion
@onready var perfect_anim = get_node("/root/Node/Game/UI/Perfect/Sprite2D/AnimationPlayer")
@onready var coin_anim = get_node("/root/Node/Game/UI/Score Panel/Earned coin/AnimationPlayer")

# game over canvas
@onready var end_anim = get_node("/root/Node/Game/GameOver/BG/AnimationPlayer")
@onready var end_canvas = get_node("/root/Node/Game/GameOver/BG")
@onready var end_scoreTxt = get_node("/root/Node/Game/GameOver/BG/Score")
@onready var best_scoreTxt = get_node("/root/Node/Game/GameOver/BG/Best Score")
@onready var total_burgerTxt = get_node("/root/Node/Game/GameOver/BG/Total Burger")
@onready var total_coinTxt = get_node("/root/Node/Game/GameOver/BG/Money")

#ingredients
#var patty = preload("res://scenes/patty.tscn")
#var lettuce = preload("res://scenes/lettuce.tscn")
#var cheese = preload("res://scenes/cheese.tscn")

var available_index = []



# particle
var particles = []
var basic_particle = preload("res://scenes/basic particle.tscn")
var flower_particle = preload("res://scenes/flower particle.tscn")
var stripe_particle = preload("res://scenes/stripe particle.tscn")
var bed_particle = preload("res://scenes/bed particle.tscn")
var pan_particle = preload("res://scenes/pan particle.tscn")

# coin collecting
@onready var coin_pos = get_node("/root/Node/Game/Left Hand/Coin Pos")
@onready var coin_destination = get_node("/root/Node/Game/UI/Money Panel")
@onready var coin_scene = $"Left Hand/Coin Pos"

func _ready():
	
	if instance == null:
		instance = self
	else:
		queue_free()
	# coin	
	coinTxt.text = str(format_number(Global.total_earning))
	current_earning = 0
	
	total_perfect = 0
	total_burger = 0
	isOver = false
	reached_limit = false
	Global.game_over = false
	Global.score = 0
	
	
	clean_array()
	ins_ingredient.clear()
	#stacked_ing.clear()
	
	clean_plate()
	result_clean()
	
	#ingredients.append(patty)
	#ingredients.append(lettuce)
	#ingredients.append(cheese)	
	
	# first start
	first_bun()
	
#	SaveLoad.load_collection()	
#	if Global.collections.size() == 0:
#		# basic ingredients that start with 
#		SaveLoad.save_collection("patty,lettuce,cheese,")
#		SaveLoad.load_collection()	
#	print(Global.collections)
	update_ingredients()
	
	particles.append(basic_particle)
	particles.append(flower_particle)
	particles.append(stripe_particle)
	particles.append(bed_particle)
	particles.append(pan_particle)
	
	
func update_ingredients():
	SaveLoad.save_collection()
	for i in range(Global.collection_ins.collection.size()):
		var new_ingredient = load(Global.collection_ins.collection[i].path)
		ingredients.append(new_ingredient)
		if Global.collection_ins.collection[i].unlock:
			if available_index.size() == 0:
				available_index.append(i)
			else:
				for j in range(available_index.size()):
					if available_index[j] != i:
						# when it checked through all elements and couldn't find match number
						if j == available_index.size() - 1:
							available_index.append(i)
					else: break
	

func _process(delta): 
	update_ingredients()
	#print(available_index)
	var debuging = false
	timer += delta
	#### (add) after first bun landed on plate
	if !debuging && Global.game_start && !finish_pause && \
	   !Global.game_over && timer >= interval:
		instantiate_ingredient(Vector2(randi_range(60, get_viewport().size.x - 60), -25))				
		timer = 0
		
	var warning = $WarningSign
	
	# when it's game over
	if Global.game_over && !isOver:
		warning.visible = false
		right_hand.disappear= true
		gameOver()
		
	# when it's not game over
	elif !Global.game_over:
		# detect if it's game over
		for i in range(ins_ingredient.size()):
			# except first bun(i = 0)
			if ins_ingredient[i] != null && i != 0:
				# game over when ingredient fall down
				if ins_ingredient[i].deleted:
					audio_manager.audio.gameover_sound_play()
					#for k in range(result.get_child_count()):
						#print(result.get_child(k).get_groups())
						#print(result.get_child(k).visible)
					print("game over - player missed falling objects")
					Global.game_over = true
					break
			
		# when it collided plate or other ingredient and it's in the middle
		# move stacked item to player node 
		for i in range(ins_ingredient.size()):
			#print("save: ", save_earning, "    earned: ", current_earning, "    total: ", Global.total_earning)
			if ins_ingredient[i] != null && ins_ingredient[i].stacked && !ins_ingredient[i].checked:			
				#print(ins_ingredient.size())				
				#print(plate.get_parent().global_position)
				
				audio_manager.audio.stack_sound_play()
				var original_scale = ins_ingredient[i].global_scale
				var original_position = ins_ingredient[i].global_position
				
				# instantiate particle
				var particle_index
				for p in Global.shop.shop.size():
					if Global.shop.shop[p].equipped:
						particle_index = p
				var new_particle = particles[particle_index].instantiate()
				new_particle.one_shot = true
				ins_ingredient[i].add_child(new_particle)		
				new_particle.emitting = true				
				
				# change parent node
				if ins_ingredient[i].is_in_group("top"):
					last_pos.remove_child(ins_ingredient[i])
				else: 
					canvas.remove_child(ins_ingredient[i])
				var new_instance = ins_ingredient[i]
				plate.add_child(new_instance)
				#print(ins_ingredient[i].get_parent())
				
				
				if !ins_ingredient[i].landed && !ins_ingredient[i].displayed:
					#print("animated,   ", ins_ingredient[i].get_parent(), "  ", ins_ingredient[i].get_groups())
					ins_ingredient[i].land_animation()
					ins_ingredient[i].landed = true
					ins_ingredient[i].sleep_mode()
				
				# resize and rescale
				new_instance.global_scale = original_scale
				new_instance.global_position = original_position
					
				# if you stack up ingredient in the middle point of plate then it's perfect, more money
				if !new_instance.is_in_group("bottom") && int(new_instance.position.x) >= -5 && int(new_instance.position.x) <= 5:
					#print("perfect!")
					total_perfect += 1
					perfect_anim.play("perfect")
					audio_manager.audio.perfect_sound_play()
					#print(total_perfect)
						
				# if it fall down somehow
				if new_instance.deleted:
					audio_manager.audio.gameover_sound_play()
					print("game over - stacked up one fell")
					Global.game_over = true
						
				# add to result
				var result_instance = ins_ingredient[i].duplicate()					
				result_instance.sleep_mode()
				result.add_child(result_instance)	
				# set result items position and scale
				var local_position = plate.to_local(original_position)
				result_instance.position = local_position
				var relative_scale = ins_ingredient[i].global_scale / plate.global_scale
				result_instance.global_scale = result.global_scale * relative_scale * 0.9
				# delete collision shape2d in displayed ingredients
				result_instance.displayed = true
				# remove same ingredient(original of duplicated one) on other nodes
				#stacked_ing[i].queue_free()
				
				
				
				if new_instance.is_in_group("top"):
					set_savedData()
					clean = true
				elif !new_instance.is_in_group("bottom"):					
					stacked_items += 1
					
				Global.score += 1
				if new_instance.is_in_group("level1"):
					audio_manager.audio.coinTxt_sound_play()
					earned_coinTxt.text = str("+ 10 coin")
					save_earning += 10
					coin_anim.play("coin")				
				elif new_instance.is_in_group("level2"):
					audio_manager.audio.coinTxt_sound_play()
					earned_coinTxt.text = str("+ 20 coin")
					save_earning += 20
					coin_anim.play("coin")			
				elif new_instance.is_in_group("level3"):
					audio_manager.audio.coinTxt_sound_play()
					earned_coinTxt.text = str("+ 30 coin")
					save_earning += 30
					coin_anim.play("coin")		
				elif new_instance.is_in_group("level4"):
					audio_manager.audio.coinTxt_sound_play()
					earned_coinTxt.text = str("+ 40 coin")
					save_earning += 40
					coin_anim.play("coin")			
					
				ins_ingredient[i].checked = true
				break;
	
		
		if !finish_pause && ins_ingredient[stacked_items - 1] != null && ins_ingredient[stacked_items - 1].stacked:
			if ins_ingredient[stacked_items - 1].global_position.y <= 120:
				warning.visible = true
				warning.get_child(0).play("warning")
				if ins_ingredient[stacked_items - 1].global_position.y <= 90:
					audio_manager.audio.gameover_sound_play()
					Global.game_over = true
					reached_limit = true
					$"GameOver/BG/Continue Button".visible = false
					print("game over: reached limit")
			else:
				warning.visible = false
		else:
			warning.visible = false
	

	if finish_pause:
		# when finish button is clicked
		# the last item, "last bun" is not gonna removed
		for i in range(ins_ingredient.size() - 1):
			if ins_ingredient[i] != null && !ins_ingredient[i].stacked:
				ins_ingredient[i].disappear_animation()
				if ins_ingredient[i].gone:
					ins_ingredient[i].queue_free()		
						
	# when a burger is built		
	if clean:
		clean_plate()	
		
	if new_burger && !Global.game_over:		
		result_manager.sliding()
		finish_pause = true
		right_hand.disappear= true
		print(right_hand.disappear)
		new_burger = false
		
		Global.burger_count[0] += 1
		
		for i in Global.shop.shop.size():
			if Global.shop.shop[i].equipped:
				match Global.shop.shop[i].name:
					"flower":
						Global.burger_count[1] += 1
					"stripe":
						Global.burger_count[2] += 1	
					"bed":
						Global.burger_count[3] += 1
					"pan":
						Global.burger_count[4] += 1
		print(Global.burger_count)		
		# make coin as many as stacked items
		for i in stacked_items:
			coin_scene.instantiate_coin(moneyJar.global_position, false, false)
		if stacked_items >= 10:
			var i = stacked_items/10
			save_earning += 10 * i
			print(i)
			for j in i:
				coin_scene.instantiate_coin(moneyJar.global_position, true, false)
			# except first bun(-1)
		if plate.get_child_count() == total_perfect - 1:
			print("all perfect")
			coin_scene.instantiate_coin(moneyJar.global_position, false, true)
			save_earning += 100
		##### (add) after countdown
		SaveLoad.save_data()
		
	if result_manager.ready_newBurger:
		total_burger += 1
		stacked_items = 0
		result_clean()
		first_bun()
		result_manager.ready_newBurger = false
	
	# when right hand timed out and it's game over
	if right_hand.loosing_power:
		audio_manager.audio.right_hand_sound_play()
		var bun = last_pos.get_child(0)
		right_hand.moving = false
		# bun falls down
		bun.freeze = false	
		finishing = true
		right_hand.loosing_power = false
		

func format_number(num):
	if num < 1000:
		return str(num)
	elif num < 1000000:
		var thousand = num / 1000
		var hundred = (num % 1000) / 100
		return str(thousand) + "." + str(hundred) + "K"
	else:
		var million = num / 1000000
		return str(million) + "M"

# set best score
func set_savedData():
	# set high score
	if Global.best_score < Global.score:
		Global.best_score = Global.score
	# set coin
	if !Global.game_over:
		current_earning += save_earning
		Global.total_earning += save_earning
	coinTxt.text = str(format_number(Global.total_earning))
	SaveLoad.save_data()
	save_earning = 0

# clean array
func clean_array():
	#print("clean array")
	for i in range(ins_ingredient.size()):
		if ins_ingredient[i] != null:
			ins_ingredient[i].queue_free()
	#for i in range(stacked_ing.size()):
		#if stacked_ing[i] != null:
			#stacked_ing[i].queue_free()

# clean result platee
func result_clean():
	#print("clean result")
	for i in range(result.get_child_count()):
		if result.get_child(i) != null:
			result.get_child(i).queue_free()	

# clean player plate					
func clean_plate():
	total_perfect = 0
	#print("clean plate")
	for i in range(plate.get_child_count()):
		if plate.get_child(i) != null:
			plate.get_child(i).fade_animation()
			##### coin particle
			if plate.get_child(i).faded:
				plate.get_child(i).queue_free()
				if i == plate.get_child_count() - 1:
					clean = false
					# show result burger
					new_burger = true
					finishing = false
					finish_pause = false
					ins_ingredient.clear()
					#stacked_ing.clear()
					history.append(Global.score)
					Global.score = 0
					

	#first_bun()

func gameOver():	
	set_savedData()
	# show game over canvas, and clean other plates
	frozen = true
	isOver = true
	hand.position = Vector2(get_viewport().size.x / 2, get_viewport().size.y - 50)
	
	end_anim.play("game over")
	
	end_scoreTxt.text = str(Global.score, " layers burger")
	total_burgerTxt.text = str(total_burger, " burgers have made")
	total_coinTxt.text = str("Earned ", current_earning, " coins / Total: ", Global.total_earning)
	best_scoreTxt.text = str("Best score: ", Global.best_score)
	
# instantiate first bun
func first_bun():
	frozen = true
	var instance = start_bun.instantiate()
	ins_ingredient.append(instance)
	#stacked_ing.append(null)
	canvas.add_child(instance)
	instance.position = Vector2(plate.get_parent().global_position.x, plate.get_parent().global_position.y - 50)
	result_manager.ready_newBurger = false
	finish_pause = false

# instantiate last bun
func finish_bun():
	var instance = last_bun.instantiate()
	instance.freeze = true
	ins_ingredient.append(instance)
	#stacked_ing.append(null)
	last_pos.add_child(instance)
	
# spawn last bun and finish the burger
func _on_finish_button_button_down():
	if Global.score >= 5 && !Global.game_over:
		audio_manager.audio.bell_sound_play()
		#print(right_hand.position)
		finish_pause = true
		if !right_hand.moving:
			right_hand.move_hand()
			finish_bun()
		elif !finishing:
			#drop the burger
			var bun = last_pos.get_child(0)
			right_hand.moving = false
			# bun falls down
			bun.freeze = false	
			finishing = true
			
# instnatiate ingredients randomly
func instantiate_ingredient(pos):
	random_index = randi_range(0, available_index.size()-1)
	var instance = ingredients[available_index[random_index]].instantiate()
	ins_ingredient.append(instance)
	# add null to stacked item array so the size is same as instantiated ingredient array
	instance.position = pos
	canvas.add_child(instance)

# replay button
func _on_replay_button_button_down():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

# continue game
func _on_continue_button_button_down():
	if !reached_limit:
		print("continue")
		end_anim.play("continue")
		Global.game_start = false
		Global.game_over = false
		isOver = false
		right_hand.loosing_power = false
		# canvas animation  
		# continue by clicking the screen, just like start game

# main menu
func _on_back_button_button_down():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
