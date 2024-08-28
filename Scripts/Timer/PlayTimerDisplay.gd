class_name PlayTimerDisplay extends Label

@export var timer : PlayTimer

func _ready():
	if timer != null:
		timer.updateTimer.connect(_UpdateDisplay)
	else : prints("WARNING: No timer set on ", name)

func _exit_tree():
	if timer != null:
		timer.updateTimer.disconnect(_UpdateDisplay)
	else : prints("WARNING: No timer set on ", name)

func _UpdateDisplay(timeLeft : float):
	if timeLeft > 0.0:
		text = "TIME LEFT: " + str(ceil(timeLeft))
	else :
		text = "TIME'S UP!"