extends Panel

class_name Shop

signal Complete

func CompleteShopping():
	Complete.emit()
