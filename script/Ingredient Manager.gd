extends Control

var instance = null

var ingredients = []
var array_length = 0
var random_index = 0

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
var game_over = false
var new_burger = false

var total_perfect = 0

@onready var canvas = get_node("/root/Node/Ingredient")
@onready var plate = get_node("/root/Node/Game/Left Hand/Player Plate/Stack Pos")
@onready var result = get_node("/root/Node/Hamburger/BG/Plate/Result Spawn Pos")
@onready var result_manager = get_node("/root/Node/Hamburger/BG")

@onready var right_hand = get_node("/root/Node/Game/Right Hand")
@onready var last_pos = get_node("/root/Node/Game/Right Hand/Move/Hand Sprite/Last Bun Pos")
var last_bun = preload("res://scenes/top bun.tscn")
var start_bun = preload("res://scenes/start bun.tscn")

@onready var earned_coin = get_node("/root/Node/Game/UI/Score Panel/Earned coin")
@onready var coin_anim = get_node("/root/Node/Game/UI/Score Panel/Earned coin/AnimationPlayer")

@onready var perfect_anim = get_node("/root/Node/Game/UI/Perfect/Sprite2D/AnimationPlayer")

# ingredient
var patty = preload("res://scenes/patty.tscn")
var lettuce = preload("res://scenes/lettuce.tscn")
var cheese = preload("res://scenes/cheese.tscn")

func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()
		
	
	
	
	ingredients.append(patty)
	ingredients.append(lettuce)
	ingredients.append(cheese)
	
	Global.score = 0
	
	# first start
	first_bun()


func _process(delta): 
	
	
	timer += delta
	#### (add) after first bun landed on plate
	if !finish_pause && !game_over && timer >= interval:
		instantiate_ingredient(Vector2(randi_range(60, get_viewport().size.x - 60), -25))		
		timer = 0
		
	# when it's game over, clean array
	if game_over:
		ins_ingredient.clear()
		stacked_ing.clear()
	# when it's not game over
	else:
		# add instantiated item that is colliding to "stacked item" array
		for i in range(ins_ingredient.size()):
			if ins_ingredient[i] != null:
				# game over when ingredient fall down
				if ins_ingredient[i].deleted:
					game_over = true
					print("game over")
					break
			
				# when it collided plate or other ingredient and it's in the middle
				if ins_ingredient[i].collided && ins_ingredient[i].in_middle:
					for j in range(stacked_ing.size()):
						if stacked_ing[j] == null:
							# add that ingredient to stacked array			
							stacked_ing[j] = ins_ingredient[i]
							frozen = true			
							break
		
		# move stacked item to player node 
		for i in range(stacked_ing.size()):
			if stacked_ing[i] != null:				
				#print(stacked_ing.size())				
				var original_scale = stacked_ing[i].global_scale
				var original_position = stacked_ing[i].global_position

				# change parent node
				if stacked_ing[i].is_in_group("top"):
					last_pos.remove_child(last_pos.get_child(0))
				else: 
					canvas.remove_child(canvas.get_child(i))
				var new_instance = stacked_ing[i].duplicate()
				plate.add_child(new_instance)							
							
						
				# resize and rescale
				new_instance.global_scale = original_scale
				new_instance.global_position = original_position
					
				# if you stack up ingredient in the middle point of plate then it's perfect, more money
				if !new_instance.is_in_group("bottom") && int(new_instance.position.x) >= -5 && int(new_instance.position.x) <= 5:
					#print("perfect!")
					total_perfect += 1
					perfect_anim.play("perfect")
						
				# if it fall down somehow
				if new_instance.deleted:
					game_over = true
						
				# add to result
				var result_instance = stacked_ing[i].duplicate()					
				result_instance.sleep_mode()
				result.add_child(result_instance)	
				# set result items position and scale
				var local_position = plate.to_local(original_position)
				result_instance.position = local_position
				var relative_scale = stacked_ing[i].global_scale / plate.global_scale
				result_instance.global_scale = result.global_scale * relative_scale * 0.8
				# delete collision shape2d in displayed ingredients
				result_instance.displayed = true
				# remove same ingredient(original of duplicated one) on other nodes
				stacked_ing[i].queue_free()
				if new_instance.is_in_group("top"):
					clean = true
					
				Global.score += 1
				if new_instance.is_in_group("level1"):
					earned_coin.text = str("+ 10 coin")
					coin_anim.play("coin")
				break	
					
	if clean:
		clean_plate()	
		
	if new_burger:		
		result_manager.sliding()
		finish_pause = true
		new_burger = false
		
	if result_manager.ready_newBurger:
		result_clean()
		first_bun()
		result_manager.ready_newBurger = false
		
		
		
func result_clean():
	for i in range(result.get_child_count()):
		if result.get_child(i) != null:
			result.get_child(i).queue_free()	
					
func clean_plate():
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
					right_hand.set_default()
					finish_pause = false
					ins_ingredient.clear()
					stacked_ing.clear()
					Global.score = 0
					
	# except first bun(-1)
	if plate.get_child_count() == total_perfect - 1:
		print("all perfect")
	##### (add) after countdown
	#first_bun()

# instantiate first bun
func first_bun():
	frozen = true
	var instance = start_bun.instantiate()
	ins_ingredient.append(instance)
	stacked_ing.append(null)
	plate.add_child(instance)
	instance.position = Vector2(0,0)
	result_manager.ready_newBurger = false
	finish_pause = false

# instantiate last bun
func finish_bun():
	var instance = last_bun.instantiate()
	instance.freeze = true
	ins_ingredient.append(instance)
	stacked_ing.append(null)
	last_pos.add_child(instance)
	
# spawn last bun and finish the burger
func _on_button_button_down():
	if Global.score >= 5 && !game_over:
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
	#print("instantiate!")
	random_index = randi_range(0, ingredients.size() - 1)
	var instance = ingredients[random_index].instantiate()
	ins_ingredient.append(instance)
	# add null to stacked item array so the size is same as instantiated ingredient array
	stacked_ing.append(null)
	instance.position = pos
	canvas.add_child(instance)
