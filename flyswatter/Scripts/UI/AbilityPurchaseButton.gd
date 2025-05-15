extends Button

enum PURCHASE_STATE {
	PURCHASEABLE,
	SOLD,
	CANNOT_AFFORD,
	NO_SPACE
}

@export var AbilityDataRef : AbilityData

var CurrentState = PURCHASE_STATE.PURCHASEABLE

func _ready() -> void:
	Update()
	
func Update():
	$StatusPanel.visible = false
	if CurrentState != PURCHASE_STATE.PURCHASEABLE:
		$StatusPanel.visible = true
		match CurrentState:
			PURCHASE_STATE.SOLD:
				$StatusPanel/Label.text = "SOLD"
			PURCHASE_STATE.CANNOT_AFFORD:
				$StatusPanel/Label.text = "CANNOT AFFORD"
			PURCHASE_STATE.NO_SPACE:
				$StatusPanel/Label.text = "NO SPACE"
		disabled = true
	else:
		disabled = false
	$AbilityLabel.text = AbilityDataRef.AbilityName
	$AbilityImage.texture = AbilityDataRef.AbilityImage
	
	


func _on_button_up() -> void:
	match CurrentState:
		PURCHASE_STATE.PURCHASEABLE:
			if AbilityDataRef.CanPurchase():
				pass
				CurrentState = PURCHASE_STATE.SOLD
				Finder.GetAbilities().AddAbility(AbilityDataRef)
	Update()
	release_focus()
