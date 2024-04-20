extends Panel

@onready var onion_img = $"HBoxContainer/Image Control/onion"
@onready var tomato_img =$"HBoxContainer/Image Control/tomato"
@onready var chickencutlet_img = $"HBoxContainer/Image Control/chickencutlet"
@onready var pickle_img = $"HBoxContainer/Image Control/pickle"
@onready var shrimp_img = $"HBoxContainer/Image Control/shrimp"
@onready var bacon_img = $"HBoxContainer/Image Control/bacon"
@onready var greenonion_img = $"HBoxContainer/Image Control/greenonion"
@onready var lemon_img = $"HBoxContainer/Image Control/lemon"
@onready var fish_img = $"HBoxContainer/Image Control/fish"
@onready var drumstick_img = $"HBoxContainer/Image Control/drumstick"
@onready var flower_img = $"HBoxContainer/Image Control/flower"
@onready var spicysauce_img = $"HBoxContainer/Image Control/spicysauce"
@onready var mayonnaise_img = $"HBoxContainer/Image Control/mayonnaise"
@onready var pineapple_img = $"HBoxContainer/Image Control/pineapple"

var img = []
var instance
var done = false
var index = 0

func _ready():
	if instance == null:
		instance = self
	else:
		queue_free()
	
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

