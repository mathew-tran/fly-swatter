extends Node

func GetPlayer() -> Player:
	return get_tree().get_nodes_in_group("Player")[0]
	
func GetBugs() -> Node2D:
	return get_tree().get_nodes_in_group("Bugs")[0].get_children()[0]
	
func GetStrawberry() -> Strawberry:
	return get_tree().get_nodes_in_group("Strawberry")[0]

func GetEffectsGroup():
	return get_tree().get_nodes_in_group("Effects")[0]

func GetEndRoundUI() -> EndRoundUI:
	return get_tree().get_nodes_in_group("EndRoundUI")[0]

func GetGame() -> Game:
	return get_tree().get_nodes_in_group("Game")[0]
