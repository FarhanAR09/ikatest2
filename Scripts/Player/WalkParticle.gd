extends CPUParticles2D

@export var playerController : PlayerController

func _ready():
	if playerController != null:
		playerController.updateMovingState.connect(_UpdateParticle)
	else : prints("WARNING: No player controller set on ", name)
	_UpdateParticle(false)
	
func _exit_tree():
	if playerController != null:
		playerController.updateMovingState.disconnect(_UpdateParticle)
	else : prints("WARNING: No player controller set on ", name)


func _UpdateParticle(isMoving : bool):
	if playerController != null:
		emitting = isMoving && playerController.is_on_floor()
	else :
		emitting = isMoving
		prints("WARNING: No player controller set on ", name)