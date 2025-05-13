extends Node

var Health = 100
@export var MaxHealth = 100

signal Death
signal Hit

func _ready() -> void:
	Setup()
	
func Setup():
	Health = MaxHealth
	
func TakeDamage(amount):
	Health -= amount
	if IsAlive() == false:
		Death.emit()
	else:
		Hit.emit()
		
func IsAlive():
	return Health > 0
