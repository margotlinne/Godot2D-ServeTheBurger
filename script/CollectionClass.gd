class Collection:
	var name : String
	var unlock : bool 
	var path : String
	var requirement_label : String
	
	func _init(name: String, unlock: bool, path: String, requirement_label: String):
		self.name = name
		self.unlock = unlock
		self.path = path
		self.requirement_label = requirement_label
		
	
var collection: = [
		Collection.new("patty", true, "res://scenes/patty.tscn","Unlock"),
		Collection.new("cheese", true, "res://scenes/cheese.tscn","Unlock"),
		Collection.new("lettuce", true, "res://scenes/lettuce.tscn","Unlock"),
		Collection.new("onion", false, "res://scenes/onion.tscn","Unlock"),
		Collection.new("tomato", false, "res://scenes/tomato.tscn","Unlock"),
		Collection.new("chickencutlet", false, "res://scenes/chickencutlet.tscn","Unlock"),
		Collection.new("pickle", false, "res://scenes/pickle.tscn","Unlock"),
		Collection.new("shrimp", false,"res://scenes/shrimp.tscn","Unlock"),
		Collection.new("bacon", false, "res://scenes/bacon.tscn","Unlock"),
		Collection.new("greenonion", false, "res://scenes/greenonion.tscn","Unlock"),
		Collection.new("lemon",  false, "res://scenes/lemon.tscn","Unlock"),		
		Collection.new("fish", false, "res://scenes/fish.tscn",	"Unlock"),
		Collection.new("drumstick",  false, "res://scenes/drumstick.tscn",	"Unlock"),	
		Collection.new("flower", false, "res://scenes/flower.tscn",	"Unlock"),
		Collection.new("spicysauce",  false, "res://scenes/spicysauce.tscn","Unlock"),
		Collection.new("mayonnaise", false, "res://scenes/mayonnaise.tscn",	"Unlock"),
		Collection.new("pineapple", false, "res://scenes/pineapple.tscn","Unlock")
]

	
	
