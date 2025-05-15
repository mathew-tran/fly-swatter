extends Button

enum PURCHASE_STATE {
	PURCHASEABLE,
	SOLD,
	UNPURCHARSEABLE
}

@export var AbilityDataRef : AbilityData

var CurrentState = PURCHASE_STATE.PURCHASEABLE

func _ready() -> void:
	Update()
	
func Update():
	$AbilityLabel.text = AbilityDataRef.AbilityName
	$AbilityImage.texture = AbilityDataRef.AbilityImage
	# Determine state
	pass
	


func _on_button_up() -> void:
	pass
