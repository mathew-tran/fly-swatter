extends Button

enum PURCHASE_STATE {
	PURCHASEABLE,
	SOLD,
	CANNOT_AFFORD,
	NO_SPACE
}

@export var AbilityDataRef : AbilityData

var CurrentState = PURCHASE_STATE.PURCHASEABLE

var AbilityInstance : Ability

func _ready() -> void:
	Update()
	AbilityInstance = AbilityDataRef.AbilityObject.instantiate()
	add_child(AbilityInstance)
	
	Finder.GetAbilities().UpdateAbilities.connect(OnUpdateAbilities)
	
func OnUpdateAbilities():
	if CurrentState == PURCHASE_STATE.SOLD:
		return
	if Finder.GetAbilities().CanAddAbility() == false:
		CurrentState = PURCHASE_STATE.NO_SPACE
	else:
		CurrentState = PURCHASE_STATE.PURCHASEABLE
	Update()
	
func ForceUpdate(newState : PURCHASE_STATE):
	CurrentState = newState
	
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
				CurrentState = PURCHASE_STATE.SOLD
				Finder.GetAbilities().AddAbility(AbilityDataRef)
				AbilityInstance.queue_free()
				Finder.GetInfoBox().HideText()
	Update()
	release_focus()


func _on_mouse_entered() -> void:
	if is_instance_valid(AbilityInstance):
		Finder.GetInfoBox().ShowText(AbilityInstance.GetInfo(), global_position)


func _on_mouse_exited() -> void:
	Finder.GetInfoBox().HideText()
