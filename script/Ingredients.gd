extends RigidBody2D

var instance = null
var collided = false
var in_middle = false
var deleted = false

func _ready():
	set_linear_damp(5)
	if instance == null:
		instance = self
	else:
		queue_free()

func _process(delta):
	# collided but not in the middle
	if collided && !in_middle:
		#print("not in the middle")
		freeze = false
		set_linear_damp(0)
		
func sleep_mode():
	freeze = true
	
func _on_body_entered(body):
	if body.name == "Player Physics" || body.is_in_group("ingredient"):
		if self.rotation < 90 && self.rotation > -90:
			#print("collided")
			collided = true
	if body.is_in_group("center"):
		#print("center")
		freeze = true
		set_freeze_mode(FREEZE_MODE_KINEMATIC)
		in_middle = true
	
	if body.is_in_group("delete"):
		#print("deleted")
		deleted = true
		


