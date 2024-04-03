extends CollisionShape2D

var parent = null
# Called when the node enters the scene tree for the first time.
func _ready():
	if self.is_in_group("collider"):
		parent = self.get_parent()
	elif self.is_in_group("middle collider"):
		parent = self.get_parent().get_parent()
	#print(parent)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if parent.displayed:
		self.queue_free()
