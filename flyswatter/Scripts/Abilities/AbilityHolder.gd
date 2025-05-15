extends Node2D

class_name AbilityHolder

var MaxAbilityAmount = 3

signal UpdateAbilities

func AddAbility(abilityData : AbilityData):
	var ability = abilityData.AbilityObject.instantiate()
	ability.AbilityDataRef = abilityData
	add_child(ability)
	ability.Implement()
	UpdateAbilities.emit()
	
func RemoveAbility(index):
	get_child(index).Destroy()
	get_child(index).queue_free()
	await get_tree().process_frame
	UpdateAbilities.emit()
	
func CanAddAbility():
	return get_child_count() < MaxAbilityAmount

func Get():
	return get_children()
