class Shop:
	var name : String
	var price : int
	var sold : bool 
	var equipped: bool
	
	func _init(name: String, price: int, sold: bool, equipped: bool):
		self.name = name
		self.price = price
		self.sold = sold
		self.equipped = equipped

var shop := [
	Shop.new("basic", 0, true, true),
	Shop.new("flower", 5000, false, false),
	Shop.new("stripe", 9000, false, false),
	Shop.new("bed", 20000, false, false),
	Shop.new("pan", 50000, false, false)
]
