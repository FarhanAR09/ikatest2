class_name WarehouseTrigger extends Area2D

@export var warehouse : Warehouse

func _ready():
	body_entered.connect(_on_body_entered)

func _exit_tree():
	body_entered.disconnect(_on_body_entered)

func _on_body_entered(node : Node2D) :
	var deliverer : Node = ClassChecker.tryGetMethodOwner(node, "assignDelivery")
	if deliverer != null && warehouse != null:
		deliverer.call("assignDelivery", warehouse.getDelivery())
