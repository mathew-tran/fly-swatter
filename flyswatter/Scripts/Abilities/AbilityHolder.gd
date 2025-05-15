extends Node2D

class_name AbilityHolder

var MaxAbilityAmount = 5

func AddAbility(abilityData : AbilityData):
	var ability = abilityData.AbilityObject.instantiate()
	add_child(ability)
	ability.Implement()
	
func RemoveAbility(index):
	get_child(index).Destroy()
	
func CanAddAbility():
	return get_child_count() < MaxAbilityAmount
