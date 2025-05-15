extends Node2D

var bAnimate = false
func Setup(newText, bAnimateText = false):
	$Control/Label.text = newText
	$Control/Label2.text = newText
	bAnimate = bAnimateText

func _ready() -> void:
	if bAnimate:
		$AnimationPlayer.play('animate')
		
func _on_timer_timeout() -> void:
	queue_free()
