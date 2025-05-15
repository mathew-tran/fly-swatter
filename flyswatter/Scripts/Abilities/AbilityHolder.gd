extends Node2D

class_name AbilityHolder

var MaxAbilityAmount = 5

func AddAbility(ability : Ability):
	add_child(ability)
	ability.Implement()
	
func RemoveAbility(index):
	get_child(index).Destroy()
	
func CanAddAbility():
	return get_child_count() < MaxAbilityAmount
