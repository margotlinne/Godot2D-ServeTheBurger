extends Node

const SCOREFILE = "user://scorefile.save"
const COINFILE = "user://coinfile.save"
const BURGERFILE = "user://burgerfile.save"
const COLLECTIONFILE = "user://collectionfile.save"
const SHOPFILE = "user://shopfile.save"
const EQUIPFILE = "user://equipfile.save"

func _ready():

	#debug_set_zero()
	#reset_collection_shop()
	
	load_data()
	load_collection()
	load_shop()

func debug_set_zero():
	var scorefile = FileAccess.open(SCOREFILE, FileAccess.WRITE_READ)
	scorefile.store_32(0)
	var coinfile = FileAccess.open(COINFILE, FileAccess.WRITE_READ)
	coinfile.store_32(0)
	var burgerfile = FileAccess.open(BURGERFILE, FileAccess.WRITE_READ)
	burgerfile.store_string("0,0,0,0,0")
	
func save_data():
	# save score
	var score_file = FileAccess.open(SCOREFILE, FileAccess.WRITE_READ)
	score_file.store_32(Global.best_score)
	# save coin
	var coin_file = FileAccess.open(COINFILE, FileAccess.WRITE_READ)
	coin_file.store_32(Global.total_earning)
	# save how many burgers have made
	var burger_file = FileAccess.open(BURGERFILE, FileAccess.WRITE_READ)
	for i in Global.shop.shop.size():
		burger_file.store_string(str(Global.burger_count[i]))
		if i != Global.shop.shop.size() - 1:
			burger_file.store_string(",")
	
	
func load_data():
	# load score
	var score_file = FileAccess.open(SCOREFILE, FileAccess.READ)
	if FileAccess.file_exists(SCOREFILE):
		Global.best_score = score_file.get_32()
	# load coin
	var coin_file = FileAccess.open(COINFILE, FileAccess.READ)
	if FileAccess.file_exists(COINFILE):
		Global.total_earning = coin_file.get_32()
		
	var burger_file = FileAccess.open(BURGERFILE, FileAccess.READ)
	if FileAccess.file_exists(BURGERFILE):
		var count_str = burger_file.get_as_text()
		var count_array = count_str.split(",")

		for i in count_array.size():
			#print(Global.collection_ins.collection[i].name, "  ", collection_array[i])
			Global.burger_count[i] = int(count_array[i])
		
func reset_collection_shop():	
	var collection_file = FileAccess.open(COLLECTIONFILE, FileAccess.WRITE_READ)
	for i in range(Global.collection_ins.collection.size()):
		if i > 2:
			Global.collection_ins.collection[i].unlock = false
		else:
			Global.collection_ins.collection[i].unlock = true
		save_collection()
				
	var shop_file = FileAccess.open(SHOPFILE, FileAccess.WRITE_READ)
	var equip_file = FileAccess.open(EQUIPFILE, FileAccess.WRITE_READ)
	for i in range(Global.shop.shop.size()):
		if i == 0:
			shop_file.store_string("true")
			equip_file.store_string("true")
		elif i != 0:
			shop_file.store_string("false")
			equip_file.store_string("false")
			if i < Global.shop.shop.size() - 1:
				shop_file.store_string(",")
	
func save_collection():
	var collection_file = FileAccess.open(COLLECTIONFILE, FileAccess.WRITE_READ)
	for i in range(Global.collection_ins.collection.size()):
		collection_file.store_string(str(Global.collection_ins.collection[i].unlock))
		if i < Global.collection_ins.collection.size() - 1:
			collection_file.store_string(",")
	
func load_collection():
	var collection_file = FileAccess.open(COLLECTIONFILE, FileAccess.READ)
	if FileAccess.file_exists(COLLECTIONFILE):
		var collection_str = collection_file.get_as_text()
		var collection_array = collection_str.split(",")

		for i in range(min(Global.collection_ins.collection.size(), collection_array.size())):
			#print(Global.collection_ins.collection[i].name, "  ", collection_array[i])
			if collection_array[i] == "false":
				Global.collection_ins.collection[i].unlock = false
			else:
				Global.collection_ins.collection[i].unlock = true
			

func save_shop():
	var shop_file = FileAccess.open(SHOPFILE, FileAccess.WRITE_READ)
	var equip_file = FileAccess.open(EQUIPFILE, FileAccess.WRITE_READ)
	
	for i in range(Global.shop.shop.size()):
		shop_file.store_string(str(Global.shop.shop[i].sold))
		equip_file.store_string(str(Global.shop.shop[i].equipped))
		#print(Global.shop.shop[i].sold, Global.shop.shop[i].equipped, "  ", i)

		if i < Global.shop.shop.size() - 1:
			shop_file.store_string(",")
			equip_file.store_string(",")
			
	#var arr = shop_file.get_as_text()
	#var arr2 = equip_file.get_as_text()
	#print("shop: " ,arr)
	#print("equip: ", arr2)
		

func load_shop():
	var shop_file = FileAccess.open(SHOPFILE, FileAccess.READ)
	var equip_file = FileAccess.open(EQUIPFILE, FileAccess.READ)
	
	if FileAccess.file_exists(SHOPFILE):
		var shop_str = shop_file.get_as_text()
		var shop_array = shop_str.split(",")

		for i in range(min(Global.shop.shop.size(), shop_array.size())):
			if shop_array[i] == "false":
				Global.shop.shop[i].sold = false
			else:
				Global.shop.shop[i].sold = true
				
	if FileAccess.file_exists(EQUIPFILE):
		var equip_str = equip_file.get_as_text()
		var equip_array = equip_str.split(",")

		for i in range(min(Global.shop.shop.size(), equip_array.size())):
			if equip_array[i] == "false":
				Global.shop.shop[i].equipped = false
			else:
				Global.shop.shop[i].equipped = true
