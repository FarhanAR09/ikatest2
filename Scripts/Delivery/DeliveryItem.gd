class_name DeliveryItem extends Node

var houseNumber : int :
	get: return houseNumber
var resource : DeliveryItemResource :
	get: return resource

func _init(newResource : DeliveryItemResource, newHouseNumber : int):
	resource = newResource
	houseNumber = newHouseNumber
