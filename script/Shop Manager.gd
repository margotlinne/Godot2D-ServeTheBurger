extends HBoxContainer

@onready var basicBtn = $"Control/VBoxContainer/plate1/Panel/HBoxContainer/Control/Label/Equip Btn1"
@onready var flowerBtn = $"Control/VBoxContainer/plate2/Panel/HBoxContainer/Control/Label/Equip Btn2"
@onready var stripeBtn = $"Control/VBoxContainer/plate3/Panel/HBoxContainer/Control/Label/Equip Btn3"
@onready var bedBtn = $"Control/VBoxContainer/plate4/Panel/HBoxContainer/Control/Label/Equip Btn4"
@onready var panBtn = $"Control2/VBoxContainer/plate1/Panel/HBoxContainer/Control/Label/Equip Btn5"


const ShopClass = preload("res://script/Shop Class.gd")

var shop_class
var btn = []

func _ready():
	btn.append(basicBtn)
	btn.append(flowerBtn)
	btn.append(stripeBtn)
	btn.append(bedBtn)
	btn.append(panBtn)
	
	shop_class = ShopClass.new()
	
func _update_equipped(index):
	for i in shop_class.shop.size():
		if i != index:
			shop_class.shop[i].equipped = false			

func _update_label():
	for i in shop_class.shop.size():
		if shop_class.shop[i].equipped:
			btn[i].get_node("Equipped").visible = true
			btn[i].get_node("Equip").visible = false
		else:
			btn[i].get_node("Equipped").visible = false
			btn[i].get_node("Equip").visible = true
		
		if shop_class.shop[i].sold && i != 0:
			btn[i].get_node("Buy").visible = false
		elif !shop_class.shop[i].sold:
			btn[i].get_node("Buy").visible = true
			btn[i].get_node("Equipped").visible = false
			btn[i].get_node("Equip").visible = false
			
	
func _on_equip_btn_1_pressed():
	if !shop_class.shop[0].equipped:
		shop_class.shop[0].equipped = true
		print("equipped 0")
	_update_label()

func _on_equip_btn_2_pressed():
	if !shop_class.shop[1].sold:
		if Global.total_earning >= shop_class.shop[1].price:
			Global.total_earning -= shop_class.shop[1].price
			print("bought 1")
			shop_class.shop[1].sold = true
	else:
		if !shop_class.shop[1].equipped:
			shop_class.shop[1].equipped = true
			print("equipped 1")
			_update_equipped(1)
		
	_update_label()
	


func _on_equip_btn_3_pressed():
	if !shop_class.shop[2].sold:
		if Global.total_earning >= shop_class.shop[2].price:
			Global.total_earning -= shop_class.shop[2].price
			shop_class.shop[2].sold = true
			print("bought 2")
	
	else:
		if !shop_class.shop[2].equipped:
			shop_class.shop[2].equipped = true
			_update_equipped(2)
			print("equipped 2")
		
	_update_label()


func _on_equip_btn_4_pressed():
	if !shop_class.shop[3].sold:
		if Global.total_earning >= shop_class.shop[3].price:
			Global.total_earning -= shop_class.shop[3].price
			shop_class.shop[3].sold = true
			print("bought 3")
	else:
		if !shop_class.shop[3].equipped:
			shop_class.shop[3].equipped = true
			_update_equipped(3)
			print("equipped 3")
		
	_update_label()
	


func _on_equip_btn_5_pressed():
	if !shop_class.shop[4].sold:
		if Global.total_earning >= shop_class.shop[4].price:
			Global.total_earning -= shop_class.shop[4].price
			shop_class.shop[4].sold = true
			print("bought 4")
	else:
		if !shop_class.shop[4].equipped:
			shop_class.shop[4].equipped = true
			_update_equipped(4)
			print("equipped 4")
		
	_update_label()
