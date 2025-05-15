extends Ability

class_name AbilityDamage

var Damage = 3
	
func Implement():
	Finder.GetPlayer().Damage += Damage

func Destroy():
	Finder.GetPlayer().Damage -= Damage
	
func GetInfo():
	return "Increase Damage by " + str(Damage)
