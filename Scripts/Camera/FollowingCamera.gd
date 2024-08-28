extends Node

@export var followingCamera : Camera2D
@export var targetCharacter : CharacterBody2D
var aheadMultiplier : float = 17.0

func _process(delta):
	if followingCamera != null && targetCharacter != null:
		followingCamera.position = lerp(followingCamera.position, targetCharacter.position + targetCharacter.velocity * delta * aheadMultiplier, delta * 5.0)
