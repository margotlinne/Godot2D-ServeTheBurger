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

var finishing = false
var game_over = false

@onready var canvas = get_node("/root/Node/Ingredient")
@onready var plate = get_node("/root/Node/Game/Left Hand/Player Plate/Stack Pos")
@onready var result = get_node("/root/Node/Hamburger/BG/Plate/First Bun/Result Spawn Pos")

@onready var right_hand = get_node("/root/Node/Game/Right Hand")

@onready var last_pos = get_node("/root/Node/Game/Right Hand/Move/Hand Sprite/Last Bun Pos")
var last_bun = preload("res://scenes/top bun.tscn")
var start_bun = preload("res://scenes/start bun.tscn")

func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()
		
	# ingredient
	var patty = preload("res://scenes/patty.tscn")
	var lettuce = preload("res://scenes/lettuce.tscn")
	var cheese = preload("res://scenes/cheese.tscn")
	
	
	
	ingredients.append(patty)
	ingredients.append(lettuce)
	ingredients.append(cheese)
	
	random_index = randi_range(0, ingredients.size() - 1)
	
	# first ingreidnet 30, 250
	instantiate_ingredient(Vector2(50,-25))
	
	# first start
	first_bun()


func _process(delta): 
	timer += delta
	if !finish_pause && !game_over && timer >= interval:
		instantiate_ingredient(Vector2(50, -25))		
		timer = 0
		
	# when it's game over, clean array
	if game_over:
		for i in range(ins_ingredient.size()):
			if ins_ingredient[i] != null:
				ins_ingredient[i].queue_free()	
	
	# when it's not game over
	else:
		# add instantiated item that is colliding to "stacked item" array
		for i in range(ins_ingredient.size()):
			if ins_ingredient[i] != null:
				# game over when ingredient fall
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
							break
		
		# move stacked item to player node 
		for i in range(stacked_ing.size()):
			if stacked_ing[i] != null:				
					
				Global.score = i
				
				var original_scale = stacked_ing[i].global_scale
				var original_position = stacked_ing[i].global_position

				if plate.get_child(i) == null:						
					# change parent node
					canvas.remove_child(canvas.get_child(i))
					var new_instance = stacked_ing[i].duplicate()
					plate.add_child(new_instance)		
						
					# resize and rescale
					new_instance.global_scale = original_scale
					new_instance.global_position = original_position
						
					# add to result
					var result_instance = stacked_ing[i].duplicate()					
					result_instance.sleep_mode()
					result.add_child(result_instance)	
						
					# set result items position and scale
					var local_position = plate.to_local(original_position)
					result_instance.position = local_position
					var relative_scale = stacked_ing[i].global_scale / plate.global_scale
					result_instance.global_scale = result.global_scale * relative_scale * 0.7
					
					
					
					if stacked_ing[i].is_in_group("top"):
						clean_plate()
						
					# remove same ingredient(original of duplicated one) on other nodes
					stacked_ing[i].queue_free()
					
					
		

func clean_plate():
	for i in range(plate.get_child_count()):
		if plate.get_child(i) != null:
			plate.get_child(i).queue_free()
	finishing = false
	first_bun()
	right_hand.set_default()
	#finish_pause = false
	#coin particle

# instantiate first bun
func first_bun():
	var instance = start_bun.instantiate()
	instance.position = Vector2(0,0)
	instance.scale = Vector2(4,4)
	plate.add_child(instance)

# instantiate last bun
func finish_bun():
	var instance = last_bun.instantiate()
	instance.freeze = true
	ins_ingredient.append(instance)
	stacked_ing.append(null)
	last_pos.add_child(instance)
	

# spawn last bun and finish the burger
func _on_button_button_down():
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
		print(bun.freeze)
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
