class_name PlayerViewManager extends Node

@export var animationPlayer : AnimatedSprite2D
@export var controller : PlayerController

signal onUpdateFaceDirection(right : bool)

func _ready():
	if controller != null:
		controller.updateMovingState.connect(_UpdateAnimation)
	if animationPlayer != null:
		animationPlayer.play("idle")

func _exit_tree():
	if controller != null:
		controller.updateMovingState.disconnect(_UpdateAnimation)
		
#func _process(delta):
	#print(controller.is_on_floor())

func _UpdateAnimation(isMoving : bool):
	if controller != null && animationPlayer != null:
		if !controller.is_on_floor() :
			animationPlayer.play("falling")
			_UpdateFacing()
		elif !isMoving :
			animationPlayer.play("idle")
		else :
			if animationPlayer.animation != "running" :
				animationPlayer.play("running")
			_UpdateFacing()
		
func _UpdateFacing():
	if animationPlayer != null && controller != null:
		if controller.velocity.x < 0:
			animationPlayer.scale.x = -1
			onUpdateFaceDirection.emit(false)
		else :
			animationPlayer.scale.x = 1
			onUpdateFaceDirection.emit(true)