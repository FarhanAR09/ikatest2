extends Node

@export var playerView : PlayerViewManager
@export var playerDeliverer : PlayerDeliverer
@export var itemDisplay : Sprite2D
@export var numberDisplay : Label

@export var offsetRight : Node2D
@export var offsetLeft : Node2D

func _ready():
	if playerDeliverer != null:
		playerDeliverer.onItemAssigned.connect(_UpdateDisplayedItem)
		playerDeliverer.onItemDelivered.connect(_RemoveDisplayedItem)
		playerDeliverer.onItemFailDelivery.connect(_WarnWrongHouse)
	else : prints("WARNING: No player deliverer set on ", name)
	if playerView != null:
		playerView.onUpdateFaceDirection.connect(_UpdateItemOffset)
	else : prints("WARNING: No player view set on ", name)

	_RemoveDisplayedItem()

func _exit_tree():
	if playerDeliverer != null:
		playerDeliverer.onItemAssigned.disconnect(_UpdateDisplayedItem)
		playerDeliverer.onItemDelivered.disconnect(_RemoveDisplayedItem)
		playerDeliverer.onItemFailDelivery.disconnect(_WarnWrongHouse)
	else : prints("WARNING: No player deliverer set on ", name)
	if playerView != null:
		playerView.onUpdateFaceDirection.disconnect(_UpdateItemOffset)
	else : prints("WARNING: No player view set on ", name)

func _UpdateDisplayedItem(item : DeliveryItem):
	#prints("Now carrying ", item.resource.name, " to house ", item.houseNumber)
	if itemDisplay != null:
		itemDisplay.texture = item.resource.texture
	else : prints("WARNING: No item display set on ", name)
	if numberDisplay != null:
		numberDisplay.text = str(item.houseNumber)
	else : prints("WARNING: No number display set on ", name)

func _RemoveDisplayedItem(_item : DeliveryItem = null):
	if itemDisplay != null:
		itemDisplay.texture = null
	else : prints("WARNING: No item display set on ", name)
	if numberDisplay != null:
		numberDisplay.text = ""
	else : prints("WARNING: No number display set on ", name)

func _UpdateItemOffset(right : bool):
	if itemDisplay != null:
		if right:
			if offsetRight != null:
				itemDisplay.position = offsetRight.position
			else : prints("WARNING: No right offset set on ", name)
		else :
			if offsetLeft != null:
				itemDisplay.position = offsetLeft.position
			else : prints("WARNING: No left offset set on ", name)
	else: prints("WARNING: No item display set on ", name)

var flashRedCoroutine
func _WarnWrongHouse(_item : DeliveryItem):
	if flashRedCoroutine != null:
		flashRedCoroutine.stop()
	flashRedCoroutine = await _TextFlashRed()

func _TextFlashRed():
	if numberDisplay != null:
		numberDisplay.label_settings.font_color = Color.RED
	await get_tree().create_timer(0.4).timeout
	if numberDisplay != null:
		numberDisplay.label_settings.font_color = Color.WHITE
