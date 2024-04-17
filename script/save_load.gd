extends Node

const SCOREFILE = "user://scorefile.save"
const COINFILE = "user://coinfile.save"
const COLLECTIONFILE = "user://collectionfile.save"

const CollectionClass = preload("res://script/CollectionClass.gd")

var collection_ins

func _ready():
	# Collection 클래스의 인스턴스 생성
	collection_ins = CollectionClass.new()
	
	#debug_set_zero()
	load_data()
	load_collection()

func debug_set_zero():
	var scorefile = FileAccess.open(SCOREFILE, FileAccess.WRITE_READ)
	scorefile.store_32(0)
	var coinfile = FileAccess.open(COINFILE, FileAccess.WRITE_READ)
	coinfile.store_32(0)
	var collectionfile = FileAccess.open(COLLECTIONFILE, FileAccess.WRITE_READ)
	collectionfile.store_string("")
	
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
