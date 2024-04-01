extends Panel

var is_mouse_pressed = false
var original_position = Vector2.ZERO


func _ready():
	# 시작 시 원래 위치 저장
	original_position = position

func _process(delta):
	# 마우스 버튼이 눌렸을 때
	if is_mouse_pressed:
		# 마우스의 현재 위치 얻기
		var mouse_position = get_global_mouse_position()
		
		# 오브젝트를 마우스 위치로 이동
		if mouse_position.x >= 40 && mouse_position.x <= 260:
			position.x = mouse_position.x
			
		if mouse_position.y >= 360 && mouse_position.y <= 520:
			position.y = mouse_position.y
			

func _on_detect_btn_button_down():
	is_mouse_pressed = true

func _on_detect_btn_button_up():
	is_mouse_pressed = false

#func _on_CollisionShape2D_body_entered(body):



