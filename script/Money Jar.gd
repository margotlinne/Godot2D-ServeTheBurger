extends Panel

@onready var phase1 = $"coin phase1"
@onready var phase2 = $"coin phase2"
@onready var phase3 = $"coin phase3"
@onready var phase4 = $"coin phase4"
@onready var phase5 = $"coin phase5"
@onready var phase6 = $"coin phase6"

func _process(delta):
	var money = Global.total_earning / 100
	
	if money >= 1:
		phase1.visible = true
	elif money >= 5:
		phase1.visible = true
		phase2.visible = true
	elif money >= 10:
		phase1.visible = true
		phase2.visible = true
		phase3.visible = true
	elif money >= 20:
		phase1.visible = true
		phase2.visible = true
		phase3.visible = true
		phase4.visible = true
	elif money >= 50:
		phase1.visible = true
		phase2.visible = true
		phase3.visible = true
		phase4.visible = true
		phase5.visible = true
	elif money >= 100:
		phase1.visible = true
		phase2.visible = true
		phase3.visible = true
		phase4.visible = true
		phase5.visible = true
		phase6.visible = true
