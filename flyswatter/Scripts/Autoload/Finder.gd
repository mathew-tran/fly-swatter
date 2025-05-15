extends Node

func GetPlayer() -> Player:
	return get_tree().get_nodes_in_group("Player")[0]
	
func GetShop() -> Shop:
	return get_tree().get_nodes_in_group("Shop")[0]
	
func GetBugs() -> Node2D:
	var bugs = get_tree().get_nodes_in_group("Bugs")[0]
	if bugs.get_child_count() > 0:
		return bugs.get_children()[0]
	return null
	
func GetStrawberry() -> Strawberry:
	return get_tree().get_nodes_in_group("Strawberry")[0]

func GetEffectsGroup():
	return get_tree().get_nodes_in_group("Effects")[0]

func GetEndRoundUI() -> EndRoundUI:
	return get_tree().get_nodes_in_group("EndRoundUI")[0]

func GetGame() -> Game:
	return get_tree().get_nodes_in_group("Game")[0]
	
func GetAbilities() -> AbilityHolder:
	return get_tree().get_nodes_in_group("Abilities")[0]
	
