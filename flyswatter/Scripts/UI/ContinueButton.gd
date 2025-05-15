extends Button

func _on_button_up() -> void:
	Finder.GetShop().CompleteShopping()
	release_focus()
	
