extends Control

var ingredients = []
var array_length = 0
var random_index = 0

var ins_ingredient = []
var stacked_ing = []
var total_colliding = 0

var timer = 0
const interval = 2

var game_over = false

var ins_once = false

@onready var canvas = get_node("/root/Node/Ingredient")
@onready var plate = get_node("/root/Node/Game/Hand Panel/Player Plate/SpawnPos")
@onready var result = get_node("/root/Node/Hamburger/Plate Sprite")

func _ready():
	
	var patty = preload("res://scenes/patty.tscn")
	#var lettuce = preload("res://scenes/lettuce.tscn")
	#var cheese = preload("res://scenes/cheese.tscn")
	
	ingredients.append(patty)
	#ingredients.append(lettuce)
	#ingredients.append(cheese)
	
	random_index = randi_range(0, ingredients.size() - 1)
	
	# first ingreidnet 30, 250
	instantiate_ingredient(Vector2(50,-25))


func _process(delta): 
	# instantiate ingredients
	#print(stacked_ing.size())
	
	timer += delta
	if !game_over && timer >= interval:
		instantiate_ingredient(Vector2(50, -25))		
		timer = 0
		
	# when it's game over, clean array
	if game_over:
		for i in range(ins_ingredient.size()):
			if ins_ingredient[i] != null:
				ins_ingredient[i].queue_free()	
	
	# when it's not game over
	else:
		# add instantiated item that is colliding to stacked array
		for i in range(ins_ingredient.size()):
			if ins_ingredient[i] != null:
				if ins_ingredient[i].deleted:
					game_over = true
					#print("game over")
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
				# when it's first ingredient
				if i == 0:
					var original_scale = stacked_ing[i].global_scale
					var original_position = stacked_ing[i].global_position

					if plate.get_child(i) == null:
						# remove same ingredient(original of duplicated one) on other nodes
						ins_ingredient[i].queue_free()
						stacked_ing[i].queue_free()
						
						# change parent node
						canvas.remove_child(canvas.get_child(i))
						var new_instance = stacked_ing[i].duplicate()
						var result_instance = stacked_ing[i].duplicate()
						plate.add_child(new_instance)
						result.add_child(result_instance)						
						
						# resize and rescale
						new_instance.global_scale = original_scale
						new_instance.global_position = original_position
						
						# result ingredient
						result_instance.global_scale = original_scale
						result_instance.global_position = original_position
						
						
				else:
					var original_scale = stacked_ing[i].global_scale
					var original_position = stacked_ing[i].global_position

					if plate.get_child(i) == null:
						# remove same ingredient(original of duplicated one) on other nodes
						ins_ingredient[i].queue_free()
						stacked_ing[i].queue_free()
						
						# change parent node
						canvas.remove_child(canvas.get_child(i))
						var new_instance = stacked_ing[i].duplicate()
						plate.add_child(new_instance)
						
						# resize and rescale
						new_instance.global_scale = original_scale
						new_instance.global_position = original_position
							


func instantiate_ingredient(pos):
	#print("instantiate!")
	random_index = randi_range(0, ingredients.size() - 1)
	var instance = ingredients[random_index].instantiate()
	ins_ingredient.append(instance)
	# add null to stacked item array so the size is same as instantiated ingredient array
	stacked_ing.append(null)
	instance.position = pos
	canvas.add_child(instance)
