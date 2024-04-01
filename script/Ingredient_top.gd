extends RigidBody2D




func _on_body_exited(body):
	# 접시에서 미끄러져 나갔을 때
	if body.name == "Player Physics":
		if self.rotation < 90 && self.rotation > -90:
			set_linear_damp(0)
			#print("not collided")
			
	# 재료에서 미끄러져 나갔을 때
	if body.is_in_group("ingredient"):
		if self.rotation < 90 && self.rotation > -90:
			set_linear_damp(0)
			#print("not collided")
