extends Node

const SCOREFILE = "user://scorefile.save"
const COINFILE = "user://coinfile.save"
const COLLECTIONFILE = "user://collectionfile.save"
const SHOPFILE = "user://shopfile.save"

const CollectionClass = preload("res://script/CollectionClass.gd")
const ShopClass = preload("res://script/Shop Class.gd")

var shop
var collection_ins

func _ready():
	# Collection 클래스의 인스턴스 생성
	collection_ins = CollectionClass.new()
	shop = ShopClass.new()
	
	#debug_set_zero()
	reset_collection_shop()
	
	load_data()
	load_collection()
	load_shop()

func debug_set_zero():
	var scorefile = FileAccess.open(SCOREFILE, FileAccess.WRITE_READ)
	scorefile.store_32(0)
	var coinfile = FileAccess.open(COINFILE, FileAccess.WRITE_READ)
	coinfile.store_32(0)
	
func save_data():
	# save score
	var score_file = FileAccess.open(SCOREFILE, FileAccess.WRITE_READ)
	score_file.store_32(Global.best_score)
	# save coin
	var coin_file = FileAccess.open(COINFILE, FileAccess.WRITE_READ)
	coin_file.store_32(Global.total_earning)
	
	
func load_data():
	# load score
	var score_file = FileAccess.open(SCOREFILE, FileAccess.READ)
	if FileAccess.file_exists(SCOREFILE):
		Global.best_score = score_file.get_32()
	# load coin
	var coin_file = FileAccess.open(COINFILE, FileAccess.READ)
	if FileAccess.file_exists(COINFILE):
		Global.total_earning = coin_file.get_32()
		
func reset_collection_shop():
	var collection_file = FileAccess.open(COLLECTIONFILE, FileAccess.WRITE_READ)
	for i in range(collection_ins.collection.size()):
		if i != 0 || i != 1 || i != 2:
			collection_file.store_string("false")
			if i < collection_ins.collection.size() - 1:
				collection_file.store_string(",")
				
	var shop_file = FileAccess.open(SHOPFILE, FileAccess.WRITE_READ)
	for i in range(shop.shop.size()):
		if i != 0:
			shop_file.store_string("false")
			if i < shop.shop.size() - 1:
				shop_file.store_string(",")
	
func save_collection():
	var collection_file = FileAccess.open(COLLECTIONFILE, FileAccess.WRITE_READ)
	for i in range(collection_ins.collection.size()):
		collection_file.store_string(str(collection_ins.collection[i].unlock))
		if i < collection_ins.collection.size() - 1:
			collection_file.store_string(",")
	
func load_collection():
	var collection_file = FileAccess.open(COLLECTIONFILE, FileAccess.READ)
	if FileAccess.file_exists(COLLECTIONFILE):
		var collection_str = collection_file.get_as_text()
		var collection_array = collection_str.split(",")

		for i in range(min(collection_ins.collection.size(), collection_array.size())):
			if collection_array[i] == "false":
				collection_ins.collection[i].unlock = false
			else:
				collection_ins.collection[i].unlock = true


func save_shop():
	var shop_file = FileAccess.open(SHOPFILE, FileAccess.WRITE_READ)
	for i in range(shop.shop.size()):
		shop_file.store_string(str(shop.shop[i].sold))
		if i < shop.collection.size() - 1:
			shop_file.store_string(",")

func load_shop():
	var shop_file = FileAccess.open(SHOPFILE, FileAccess.READ)
	if FileAccess.file_exists(SHOPFILE):
		var shop_str = shop_file.get_as_text()
		var shop_array = shop_str.split(",")

		for i in range(min(shop.shop.size(), shop_array.size())):
			if shop_array[i] == "false":
				shop.shop[i].sold = false
			else:
				shop.shop[i].sold = true
