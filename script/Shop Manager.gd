extends HBoxContainer

@onready var basicBtn = $"Control/VBoxContainer/plate1/Panel/HBoxContainer/Control/Label/Equip Btn1"
@onready var flowerBtn = $"Control/VBoxContainer/plate2/Panel/HBoxContainer/Control/Label/Equip Btn2"
@onready var stripeBtn = $"Control/VBoxContainer/plate3/Panel/HBoxContainer/Control/Label/Equip Btn3"
@onready var bedBtn = $"Control/VBoxContainer/plate4/Panel/HBoxContainer/Control/Label/Equip Btn4"
@onready var panBtn = $"Control2/VBoxContainer/plate1/Panel/HBoxContainer/Control/Label/Equip Btn5"

@onready var basicPlate = get_node("/root/Node/Game/Left Hand/Player Plate/Basic Plate")
@onready var flowerPlate = get_node("/root/Node/Game/Left Hand/Player Plate/Flower Plate")
@onready var stripePlate = get_node("/root/Node/Game/Left Hand/Player Plate/Stripe Plate")
@onready var bedPlate = get_node("/root/Node/Game/Left Hand/Player Plate/Bed Plate")
@onready var panPlate = get_node("/root/Node/Game/Left Hand/Player Plate/Pan Plate")

var btn = []
var plate = []

func _ready():
	btn.append(basicBtn)
	btn.append(flowerBtn)
	btn.append(stripeBtn)
	btn.append(bedBtn)
	btn.append(panBtn)
	
	plate.append(basicPlate)
	plate.append(flowerPlate)
	plate.append(stripePlate)
	plate.append(bedPlate)
	plate.append(panPlate)
	
	

	SaveLoad.load_shop()
	_update_label()
	_update_equipped()
#	for i in Global.shop.shop.size():
#		print(Global.shop.shop[i].name, "   ", Global.shop.shop[i].price, "   ",\
#		Global.shop.shop[i].equipped, "  ", Global.shop.shop[i].sold)
	
	
func _update_plate(index):
	for i in Global.shop.shop.size():
		if i != index:
			Global.shop.shop[i].equipped = false		
			plate[i].visible = false	
			plate[i].get_node("center/CollisionShape2D").disabled = true
			plate[i].get_node("Player Physics/CollisionShape2D").disabled = true
		else:
			plate[i].visible = true
			plate[i].get_node("center/CollisionShape2D").disabled = false
			plate[i].get_node("Player Physics/CollisionShape2D").disabled = false

	
func _update_equipped():
	for i in Global.shop.shop.size():
		if !Global.shop.shop[i].equipped:
			plate[i].visible = false	
			plate[i].get_node("center/CollisionShape2D").disabled = true
			plate[i].get_node("Player Physics/CollisionShape2D").disabled = true
		else:
			plate[i].visible = true
			plate[i].get_node("center/CollisionShape2D").disabled = false
			plate[i].get_node("Player Physics/CollisionShape2D").disabled = false

func _update_label():
	for i in Global.shop.shop.size():
		if Global.shop.shop[i].equipped:
			btn[i].get_node("Equipped").visible = true
			btn[i].get_node("Equip").visible = false
		else:
			btn[i].get_node("Equipped").visible = false
			btn[i].get_node("Equip").visible = true
		
		if Global.shop.shop[i].sold && i != 0:
			btn[i].get_node("Buy").visible = false
		elif !Global.shop.shop[i].sold:
			btn[i].get_node("Buy").visible = true
			btn[i].get_node("Equipped").visible = false
			btn[i].get_node("Equip").visible = false
	SaveLoad.save_shop()		
	#for i in Global.shop.shop.size():
		#print(Global.shop.shop[i].name, "   ", Global.shop.shop[i].price, "   ",\
		#Global.shop.shop[i].equipped, "  ", Global.shop.shop[i].sold)
	
func _on_equip_btn_1_pressed():
	if !Global.shop.shop[0].equipped:
		Global.shop.shop[0].equipped = true
		_update_plate(0)
		print("equipped 0")
	_update_label()

func _on_equip_btn_2_pressed():
	if !Global.shop.shop[1].sold:
		if Global.total_earning >= Global.shop.shop[1].price:
			Global.total_earning -= Global.shop.shop[1].price
			print("bought 1")
			Global.shop.shop[1].sold = true
	else:
		if !Global.shop.shop[1].equipped:
			Global.shop.shop[1].equipped = true
			print("equipped 1")
			_update_plate(1)
		
	_update_label()
	


func _on_equip_btn_3_pressed():
	if !Global.shop.shop[2].sold:
		if Global.total_earning >= Global.shop.shop[2].price:
			Global.total_earning -= Global.shop.shop[2].price
			Global.shop.shop[2].sold = true
			print("bought 2")
	
	else:
		if !Global.shop.shop[2].equipped:
			Global.shop.shop[2].equipped = true
			_update_plate(2)
			print("equipped 2")
		
	_update_label()


func _on_equip_btn_4_pressed():
	if !Global.shop.shop[3].sold:
		if Global.total_earning >= Global.shop.shop[3].price:
			Global.total_earning -= Global.shop.shop[3].price
			Global.shop.shop[3].sold = true
			print("bought 3")
	else:
		if !Global.shop.shop[3].equipped:
			Global.shop.shop[3].equipped = true
			_update_plate(3)
			print("equipped 3")
		
	_update_label()
	


func _on_equip_btn_5_pressed():
	if !Global.shop.shop[4].sold:
		if Global.total_earning >= Global.shop.shop[4].price:
			Global.total_earning -= Global.shop.shop[4].price
			Global.shop.shop[4].sold = true
			print("bought 4")
	else:
		if !Global.shop.shop[4].equipped:
			Global.shop.shop[4].equipped = true
			_update_plate(4)
			print("equipped 4")
		
	_update_label()
