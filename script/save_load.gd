extends Node

const SCOREFILE = "user://scorefile.save"
const COINFILE = "user://coinfile.save"

func _ready():
	#debug_set_zero()
	load_data()

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

