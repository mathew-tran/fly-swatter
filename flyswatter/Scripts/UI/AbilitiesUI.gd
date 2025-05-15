extends HBoxContainer

var AbilityUIClass = preload("res://Prefabs/UI/AbilityUI.tscn")

func _ready() -> void:
	Finder.GetAbilities().UpdateAbilities.connect(OnUpdateAbilities)
	OnUpdateAbilities()
	
func OnUpdateAbilities():
	for child in get_children():
		child.queue_free()
	
	for index in range(0, len(Finder.GetAbilities().Get())):
		var instance = AbilityUIClass.instantiate()
		instance.Setup(Finder.GetAbilities().Get()[index], index)
		add_child(instance)
	
	
