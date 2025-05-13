extends Sprite2D

class_name Strawberry

func _ready() -> void:
	$HealthComponent.Hit.connect(OnHit)
	$HealthComponent.Death.connect(OnDeath)
	
func OnHit():
	$AnimationPlayer.play("nibbled")
	
func OnDeath():
	pass
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	$HealthComponent.TakeDamage(5)
