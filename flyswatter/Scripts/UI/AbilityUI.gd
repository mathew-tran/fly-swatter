extends Panel

var AbilityRef : Ability
var Index = -1

enum ABILITY_UI_STATE {
	SHOWN,
	HIDDEN
}
var AbilityUIState = ABILITY_UI_STATE.HIDDEN

func _ready() -> void:
	Finder.GetGame().GameStateUpdate.connect(OnGameStateUpdate)
	OnGameStateUpdate(Finder.GetGame().CurrentState)
	
func OnGameStateUpdate(newState : Game.GAME_STATE):
	if newState == Game.GAME_STATE.IN_GAME:
		$SellLabel.visible = false
	else:
		$SellLabel.visible = true
		
func Setup(ability : Ability, index):
	AbilityRef = ability
	$TextureRect.texture = ability.AbilityDataRef.AbilityImage
	Index = index

func _on_mouse_entered() -> void:
	if is_instance_valid(AbilityRef):
		Finder.GetInfoBox().ShowText(AbilityRef.GetInfo(), global_position)
		AbilityUIState = ABILITY_UI_STATE.SHOWN

func _on_mouse_exited() -> void:
	Finder.GetInfoBox().HideText()
	AbilityUIState = ABILITY_UI_STATE.HIDDEN

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if AbilityUIState == ABILITY_UI_STATE.SHOWN and Finder.GetGame().IsInShop():
			Finder.GetAbilities().RemoveAbility(Index)
