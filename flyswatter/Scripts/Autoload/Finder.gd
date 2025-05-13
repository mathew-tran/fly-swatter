extends Node

func GetStrawberry() -> Strawberry:
	return get_tree().get_nodes_in_group("Strawberry")[0]
