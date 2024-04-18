extends Node


var score = 0
var game_over = false
var best_score = 0
var total_earning = 0

var game_start = false


const CollectionClass = preload("res://script/CollectionClass.gd")
const ShopClass = preload("res://script/Shop Class.gd")

var shop
var collection_ins

	
func _ready():
	# Collection 클래스의 인스턴스 생성
	collection_ins = CollectionClass.new()
	shop = ShopClass.new()
