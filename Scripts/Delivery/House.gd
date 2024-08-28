class_name House extends Node

@export var houseNumber : int = 0
@export var scoreManger : ScoreManager

@export var sfxManager : SFXManager
@export var deliverySFX : AudioStream

func tryDeliver(item : DeliveryItem) -> bool:
	if item.houseNumber == houseNumber:
		#prints(item.resource.name, " delivered")
		if scoreManger != null:
			scoreManger.AddScore(10)
		else : prints("WARNING: No score manager set on ", name)

		if sfxManager != null && deliverySFX != null:
			sfxManager.PlaySFX(deliverySFX, 0)
		else : prints("WARNING: No sfx manager or delivery sfx set on ", name)

		return true
	return false