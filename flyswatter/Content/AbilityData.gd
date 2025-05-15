extends Resource

class_name AbilityData

@export var AbilityName = ""
@export var AbilityPrice = 0
@export var AbilityImage : Texture
@export var AbilityObject : PackedScene

func CanPurchase():
	return true
	
