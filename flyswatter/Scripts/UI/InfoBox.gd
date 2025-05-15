extends Panel

class_name InfoBox

func ShowText(newText, newPosition):
	$Label.text = newText
	global_position = newPosition
	visible = true
	
	if global_position.y + get_rect().size.y > Definitions.ScreenSize.y:
		global_position.y = Definitions.ScreenSize.y - get_rect().size.y

func HideText():
	visible = false
