extends Ability

class_name AbilityDamage

func _ready() -> void:
	Implement()
	
func Implement():
	Finder.GetPlayer().Damage += 3

func Destroy():
	Finder.GetPlayer().Damage -= 3
	
