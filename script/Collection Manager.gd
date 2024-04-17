extends Control


@onready var first_page = $ColorRect/Book/HBoxContainer
@onready var second_page = $ColorRect/Book/HBoxContainer2
@onready var third_page = $ColorRect/Book/HBoxContainer3
@onready var shop_page = $ColorRect/Book/HBoxContainer4

@onready var rightBtn = $"ColorRect/Book/Right Button"
@onready var leftBtn = $"ColorRect/Book/Left Button"

var current_page = 1
var shop_open = false



func _ready():
	update_btn()

func update_btn():
	if first_page.visible == true:
		leftBtn.visible = false
		rightBtn.visible = true
	elif third_page.visible == true:
		leftBtn.visible = true
		rightBtn.visible = false
	else:
		leftBtn.visible = true
		rightBtn.visible = true
	
	if shop_open:
		leftBtn.visible = false
		rightBtn.visible = false
		
		
func _on_right_button_pressed():
	if current_page == 1:
		first_page.visible = false
		second_page.visible = true
		current_page += 1
	elif current_page == 2:
		second_page.visible = false
		third_page.visible = true
		current_page += 1
	update_btn()


func _on_left_button_pressed():
	if current_page == 2:
		second_page.visible = false
		first_page.visible = true
		current_page -= 1
	elif current_page == 3:
		third_page.visible = false
		second_page.visible = true
		current_page -= 1
	update_btn()


func _on_shop_button_pressed():
	shop_open = not shop_open
	update_btn()
	shop_page.visible = not shop_page.visible
	
