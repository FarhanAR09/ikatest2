class_name Warehouse extends Node

@export var assignSFX : AudioStream

@export var sfxManager : SFXManager
@export var warehouseTrigger : WarehouseTrigger
var _deliveryResources : Array[DeliveryItemResource] = [
    preload("res://Resources/DeliveryItemRes1.tres"),
    preload("res://Resources/DeliveryItemRes2.tres"),
    preload("res://Resources/DeliveryItemRes3.tres"),
    preload("res://Resources/DeliveryItemRes4.tres"),
]

func getDelivery() -> DeliveryItem:
    if sfxManager != null && assignSFX != null:
        sfxManager.PlaySFX(assignSFX, 0)

    var houseNumber : int = randi_range(1, 2)
    return DeliveryItem.new(_deliveryResources[randi_range(0, _deliveryResources.size() - 1)], houseNumber)