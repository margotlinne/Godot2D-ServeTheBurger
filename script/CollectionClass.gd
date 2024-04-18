class Collection:
	var name : String
	var requirement : String
	var requirement_val : int
	var unlock : bool 
	var path : String
	
	func _init(name: String, requirement: String, requirement_val: int, unlock: bool, path: String):
		self.name = name
		self.requirement = requirement
		self.requirement_val = requirement_val
		self.unlock = unlock
		self.path = path
		
	
var collection: = [
		Collection.new("patty", "", 0, true, "res://scenes/patty.tscn"),
		Collection.new("cheese", "", 0, true, "res://scenes/cheese.tscn"),
		Collection.new("lettuce", "", 0, true, "res://scenes/lettuce.tscn"),
		Collection.new("onion", "", 0, false, "res://scenes/onion.tscn"),
		Collection.new("tomato", "", 0, false, "res://scenes/tomato.tscn"),
		Collection.new("chickencutlet", "", 0, false, "res://scenes/chickencutlet.tscn"),
		Collection.new("pickle", "", 0, false, "res://scenes/pickle.tscn"),
		Collection.new("shrimp", "", 0, false, "res://scenes/shrimp.tscn"),
		Collection.new("bacon", "", 0, false, "res://scenes/bacon.tscn"),
		Collection.new("greenonion", "", 0, false, "res://scenes/greenonion.tscn"),
		Collection.new("lemon", "", 0, false, "res://scenes/lemon.tscn"),		
		Collection.new("fish", "", 0, false, "res://scenes/fish.tscn"),		
		Collection.new("drumstick", "", 0, false, "res://scenes/drumstick.tscn"),		
		Collection.new("flower", "", 0, false, "res://scenes/flower.tscn"),		
		Collection.new("spicysauce", "", 0, false, "res://scenes/spicysauce.tscn"),		
		Collection.new("mayonnaise", "", 0, false, "res://scenes/mayonnaise.tscn"),		
		Collection.new("pineapple", "", 0, false, "res://scenes/pineapple.tscn")
]

	
	
