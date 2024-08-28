extends Node

func tryGetMethodOwner(node : Node, method : String) -> Node:
	if node.has_method(method):
		return node
	for child in node.get_children():
		if tryGetMethodOwner(child, method) != null :
			return child
	return null