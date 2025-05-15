extends Node2D

class_name BugGroup


var FliesToKill = 0

signal WaveComplete

func _ready() -> void:
	for child in get_children():
		FliesToKill += 1
		child.Dead.connect(OnDead)
		
func OnDead():
	FliesToKill -= 1
	if FliesToKill <= 0:
		WaveComplete.emit()
		
