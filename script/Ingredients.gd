extends RigidBody2D

var instance = null
var collided = false
var in_middle = false
var deleted = false
var animated = false
var faded = false
var perfect = false
var landed = false
var displayed = false

@onready var anim = $Sprite2D/AnimationPlayer

func _ready():
	set_linear_damp(5)
	if instance == null:
		instance = self
	else:
		queue_free()

func _process(delta):
	# collided but not in the middle
	if collided:
		if !in_middle:
			#print("not in the middle")
			freeze = false
			set_linear_damp(0)
		elif self.is_in_group("bottom"):			
			if !animated:
				anim.landed()
				animated = true
			freeze = true
			set_freeze_mode(FREEZE_MODE_KINEMATIC)
			
func fade_animation():
	if !faded:
		anim.play("ingredients_fade")
		
func sleep_mode():
	freeze = true
	
func _on_body_entered(body):
	if body.is_in_group("player") || body.is_in_group("ingredient"):
		if self.rotation < 90 && self.rotation > -90:
			#print("collided")
			collided = true
			
	if body.is_in_group("center"):
		in_middle = true
		if !self.is_in_group("bottom"):
			if !animated:
				anim.landed()
				animated = true
			freeze = true
			set_freeze_mode(FREEZE_MODE_KINEMATIC)
	
	if body.is_in_group("delete"):		
		#print("deleted")
		deleted = true
		
func _on_animation_player_animation_finished(animation_name):
	if animation_name == "ingredients_fade":
		#print("animation done")
		faded = true
