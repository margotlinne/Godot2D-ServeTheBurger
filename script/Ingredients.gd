extends RigidBody2D

var instance = null
var collided = false
var on_plate = false
var floating = false

func _ready():
	set_linear_damp(20)
	if instance == null:
		instance = self
	else:
		queue_free()

	
func after_collided():
	if collided:
		return true
	else:
		return false

func not_onPlate():
	floating = true

func _on_body_entered(body):
	if body.name == "Player Physics" || (!floating && body.is_in_group("ingredient")):
		if self.rotation < 90 && self.rotation > -90:
			slow_down()
			if(body.name == "Player Physics"):
				on_plate = true

func _on_body_exited(body):
	if body.name == "Player Physics":
		if self.rotation < 90 && self.rotation > -90:
			speed_up()
			on_plate = false
			#print("not collided")
			
	if body.is_in_group("ingredients"):
		if self.rotation < 90 && self.rotation > -90:
			speed_up()
	
	
func slow_down():
	set_linear_damp(100)
	collided = true

func speed_up():
	set_linear_damp(0)
	collided = false
			
			
