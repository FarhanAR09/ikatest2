class_name DeliveryArguments

var item : DeliveryItem
var successStateCallback : Callable

func _init(newItem : DeliveryItem, newSuccessStateCallback : Callable):
    item = newItem
    successStateCallback = newSuccessStateCallback