extends Sprite2D

class_name Player

var Damage = 5
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if $AnimationPlayer.is_playing() == false:
			$AnimationPlayer.play("slap")

func Land():
	$CPUParticles2D.emitting = true
	var flies = $HitArea.get_overlapping_areas()
	for fly in flies:
		fly.get_parent().Hit(Damage)
		
	
