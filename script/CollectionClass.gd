class Collection:
	var name : String
	var requirement : String
	var requirement_val : int
	var unlock : bool 
	var path : String
	var requirement_label : String
	var achievement_done : bool
	
	func _init(name: String, requirement: String, requirement_val: int, \
	unlock: bool, path: String, requirement_label: String, achievement_done: bool):
		self.name = name
		self.requirement = requirement
		self.requirement_val = requirement_val
		self.unlock = unlock
		self.path = path
		self.requirement_label = requirement_label
		self.achievement_done = achievement_done
		
	
var collection: = [
		Collection.new("patty", "none", 0, true, "res://scenes/patty.tscn",\
		"Unlock", true),
		Collection.new("cheese", "none", 0, true, "res://scenes/cheese.tscn",\
		"Unlock", true),
		Collection.new("lettuce", "none", 0, true, "res://scenes/lettuce.tscn",\
		"Unlock", true),
		Collection.new("onion", "Global.score", 20, false, "res://scenes/onion.tscn",\
		"Unlock", false),
		Collection.new("tomato", "", 0, false, "res://scenes/tomato.tscn",\
		"Unlock", false),
		Collection.new("chickencutlet", "", 0, false, "res://scenes/chickencutlet.tscn",\
		"Unlock", false),
		Collection.new("pickle", "", 0, false, "res://scenes/pickle.tscn",\
		"Unlock", false),
		Collection.new("shrimp", "", 0, false, "res://scenes/shrimp.tscn",\
		"Unlock", false),
		Collection.new("bacon", "", 0, false, "res://scenes/bacon.tscn",\
		"Unlock", false),
		Collection.new("greenonion", "", 0, false, "res://scenes/greenonion.tscn",\
		"Unlock", false),
		Collection.new("lemon", "", 0, false, "res://scenes/lemon.tscn",\
		"Unlock", false),		
		Collection.new("fish", "", 0, false, "res://scenes/fish.tscn",\
		"Unlock", false),
		Collection.new("drumstick", "", 0, false, "res://scenes/drumstick.tscn",\
		"Unlock", false),	
		Collection.new("flower", "", 0, false, "res://scenes/flower.tscn",\
		"Unlock", false),
		Collection.new("spicysauce", "", 0, false, "res://scenes/spicysauce.tscn",\
		"Unlock", false),
		Collection.new("mayonnaise", "", 0, false, "res://scenes/mayonnaise.tscn",\
		"Unlock", false),
		Collection.new("pineapple", "", 0, false, "res://scenes/pineapple.tscn",\
		"Unlock", false)
]

	
	
