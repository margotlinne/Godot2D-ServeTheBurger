extends RigidBody2D

var instance = null
var collided = false
var in_middle = false
var deleted = false
var landed = false
var landAnimation_done = false 
var faded = false
var perfect = false
var displayed = false
var gone = false
var stacked = false
var checked

@onready var anim = $Sprite2D/AnimationPlayer

func _ready():
	set_linear_damp(5)
	if instance == null:
		instance = self
	else:
		queue_free()
	checked = false

func _process(delta):		
	# collided but not in the middle
	if collided:
		if in_middle:	
			stacked = true
		else:
			stacked = false
			awake_mode()
	# when it's not displayed(in result node) and didn't land yet, and it's game over
	elif !displayed && !checked && Global.game_over:
		self.queue_free()
		
		
		
func awake_mode():
	freeze = false
	set_linear_damp(0)
		
func sleep_mode():
	freeze = true
	set_freeze_mode(FREEZE_MODE_KINEMATIC)
	
func _on_body_entered(body):
	if !displayed:
		if ((body.is_in_group("player") && self.is_in_group("bottom")) || body.is_in_group("ingredient")) && !gone && !collided:
			if self.rotation <= 90 && self.rotation >= -90:
				#print(self.get_groups())
				#print(body.get_groups())			
				collided = true
				#print(collided)
			
		if body.is_in_group("center") && !in_middle:
			in_middle = true
			#print(in_middle)
			
		if body.is_in_group("delete"):		
			#print("deleted")
			deleted = true	
		
func land_animation():
	if !landed:
		anim.play("ingredients_land")
		
func fade_animation():
	if !faded:
		anim.play("ingredients_fade")
		
func disappear_animation():
	anim.play("disappear")
	
func _on_animation_player_animation_finished(animation_name):
	if animation_name == "ingredients_fade":
		#print("faded  ", self.get_groups())
		faded = true
		
	elif animation_name == "disappear":
		#print("gone  ", self.get_groups())
		gone = true
		
	elif animation_name == "ingredients_land":
		#print("?  ", self.get_groups())
		landAnimation_done = true	
