extends CollisionShape2D


var viewport_width

func _process(delta):
	viewport_width = get_viewport().size.x
	var shape = RectangleShape2D.new()
	shape.extents.x = viewport_width * 1.2
	set_shape(shape)
	
	# Viewport의 크기 가져오기
	var viewport_size = get_viewport().get_size()
	
	# 윈도우 크기가 변경될 때마다 충돌 위치 조정
	var relative_position = Vector2(
		position.x / viewport_size.x,
		position.y / viewport_size.y
	)
	
	# 상대적인 위치를 픽셀 좌표로 변환하여 설정
	position = relative_position * get_viewport_rect().size
