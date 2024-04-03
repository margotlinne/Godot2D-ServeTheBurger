extends Panel

var is_mouse_pressed = false
var original_position = Vector2.ZERO

var timer = 0
@onready var plate = get_node("/root/Node/Game")

func _ready():
	# 시작 시 원래 위치 저장
	original_position = position

func _process(delta):
	if plate.frozen:
		timer += delta
		if timer >= 0.5:
			timer = 0
			plate.frozen = false
			
	# 마우스 버튼이 눌렸을 때
	if is_mouse_pressed && !plate.frozen:
		# 마우스의 현재 위치 얻기
		var mouse_position = get_global_mouse_position()
		
		var screen_width = get_viewport().size.x
		var screen_height = get_viewport().size.y
		
		# 오브젝트를 마우스 위치로 이동
		if mouse_position.x >= 40 && mouse_position.x <= screen_width - 40:
			position.x = mouse_position.x
			
		if mouse_position.y >= screen_height/2 && mouse_position.y <= screen_height:
			position.y = mouse_position.y
			

func _on_detect_btn_button_down():
	is_mouse_pressed = true

func _on_detect_btn_button_up():
	is_mouse_pressed = false

#func _on_CollisionShape2D_body_entered(body):



