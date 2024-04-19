extends Node


var score = 0
var game_over = false
var best_score = 0
var total_earning = 0
var total_made_burger = 0
var total_burgerWflower = 0
var total_burgerWstripe = 0
var total_burgerWbed = 0
var total_burgerWpan = 0
var game_start = false

var burger_count = []

const CollectionClass = preload("res://script/CollectionClass.gd")
const ShopClass = preload("res://script/Shop Class.gd")

var shop
var collection_ins

	
func _ready():
	burger_count.append(total_made_burger)
	burger_count.append(total_burgerWflower)
	burger_count.append(total_burgerWstripe)
	burger_count.append(total_burgerWbed)
	burger_count.append(total_burgerWpan)
	# Collection 클래스의 인스턴스 생성
	collection_ins = CollectionClass.new()
	shop = ShopClass.new()
