extends Panel

@onready var phase1 = $"coin phase1"
@onready var phase2 = $"coin phase2"
@onready var phase3 = $"coin phase3"
@onready var phase4 = $"coin phase4"
@onready var phase5 = $"coin phase5"
@onready var phase6 = $"coin phase6"

func _process(delta):
	var money = Global.total_earning / 100
	
	if money == 1:
		phase1.visible = true
	elif money == 2:
		phase2.visible = true
	elif money == 3:
		phase3.visible = true
	elif money == 5:
		phase4.visible = true
	elif money == 6:
		phase5.visible = true
	elif money == 10:
		phase6.visible = true
