extends CollisionShape2D


var viewport_width

func _process(delta):
	viewport_width = get_viewport().size.x
	
	var shape = RectangleShape2D.new()
	shape.extents.x = viewport_width
	set_shape(shape)
