extends Sprite2D

var fall_pos
var mid_pos 
var timer = 0
var ready_for_tween = false
var instance = null

func _ready():
	var view = get_viewport().size
	fall_pos = Vector2(randi_range(50, view.x - 50), view.y - 60)
	mid_pos = Vector2(randi_range(position.x, fall_pos.x), randi_range(position.y, fall_pos.y))
	
	if instance == null:
		instance = self
	else:
		queue_free()
	
func bezier(p0, p1, p2, t):
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	var r = q0.lerp(q1, t)	
	return r
	
func _process(delta):
	timer += delta
	if timer < 0.5:
		position = bezier(position, mid_pos, fall_pos, timer)
	
		#print(fall_pos)
		#print(mid_pos)
		#print(position)
#	else:
#		ready_for_tween = true
