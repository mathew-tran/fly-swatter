extends Panel

class_name EndRoundUI

signal EndRoundAnimFinished

func _ready() -> void:
	Finder.GetGame().RoundEnded.connect(OnRoundedEnded)
	Finder.GetGame().RoundStarted.connect(OnRoundStarted)

func OnRoundedEnded():
	$AnimationPlayer.play("anim")

func OnRoundStarted():
	$AnimationPlayer.play("leave")	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "anim":
		EndRoundAnimFinished.emit()
	
