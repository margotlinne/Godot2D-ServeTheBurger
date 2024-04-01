extends Control

var ingredients = []
var array_length = 0
var random_index = 0

var ins_ingredient = []

var timer = 0
const interval = 4

@onready var canvas = get_node("/root/Node/Ingredient")
@onready var plate = get_node("/root/Node/Game/Hand Panel/Plate Sprite")

func _ready():
	var patty = preload("res://scenes/patty.tscn")
	#var lettuce = preload("res://scenes/lettuce.tscn")
	#var cheese = preload("res://scenes/cheese.tscn")
	
	ingredients.append(patty)
	#ingredients.append(lettuce)
	#ingredients.append(cheese)
	
	random_index = randi_range(0, ingredients.size() - 1)
	
	# first ingreidnet
	instantiate_ingredient(Vector2(randf_range(30, 250),-25))


func _process(delta): 
	timer += delta
	if timer >= interval:
		instantiate_ingredient(Vector2(50, -25))		
		timer = 0
		
	for i in ins_ingredient.size():
		if !ins_ingredient[i].on_plate:
			if(i < ins_ingredient.size() - 1):
				ins_ingredient[i - 1].not_onPlate()

func instantiate_ingredient(pos):
	print("instantiate!")
	array_length = ingredients.size()	
	random_index = randi_range(0, array_length - 1)
	var instance = ingredients[random_index].instantiate()
	ins_ingredient.append(instance)
	instance.position = pos
	canvas.add_child(instance)
