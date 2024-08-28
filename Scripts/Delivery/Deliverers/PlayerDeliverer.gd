class_name PlayerDeliverer extends Node

signal onItemAssigned(item : DeliveryItem)
signal onItemDelivered(item : DeliveryItem)
signal onItemFailDelivery(item : DeliveryItem)

var _item : DeliveryItem

func assignDelivery(item : DeliveryItem):
	if _item != null:
		_item.queue_free()
	_item = item
	onItemAssigned.emit(_item)
	#prints("Delivering number: ", _item.houseNumber)
	#prints("Resource name: ", _item.resource.name)

func deliverItem() -> DeliveryArguments:
	if _item != null:
		return DeliveryArguments.new(_item, trackDeliverySuccessState)
	return null

func trackDeliverySuccessState(success : bool):
	if success:
		onItemDelivered.emit(_item)
		_item.queue_free()
	else :
		onItemFailDelivery.emit(_item)
	#prints("Success: ", str(success))
