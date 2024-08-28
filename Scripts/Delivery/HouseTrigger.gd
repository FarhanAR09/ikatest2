extends Area2D

@export var house : House

func _ready():
	body_entered.connect(_on_body_entered)

func _exit_tree():
	body_entered.disconnect(_on_body_entered)

func _on_body_entered(node : Node2D) :
	var deliverer : Node = ClassChecker.tryGetMethodOwner(node, "deliverItem")
	if deliverer != null && house != null:
		var deliveryArgument : DeliveryArguments = deliverer.call("deliverItem")
		if deliveryArgument != null && deliveryArgument.successStateCallback != null:
			var success : bool = house.tryDeliver(deliveryArgument.item)
			deliveryArgument.successStateCallback.call(success)
