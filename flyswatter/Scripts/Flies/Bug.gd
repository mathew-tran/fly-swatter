extends AnimatedSprite2D

class_name Bug

var Speed = 10

enum STATE {
	MOVING,
	STOPPED,
	DEAD
}
var CurrentState = STATE.MOVING

signal Dead

func _ready() -> void:
	$HealthComponent.Death.connect(OnDeath)
	
func OnDeath():
	play("dead")
	CurrentState = STATE.DEAD
	Dead.emit()
	
func _process(delta: float) -> void:
	match CurrentState:
		STATE.MOVING:
			var direction = (Finder.GetStrawberry().global_position - global_position).normalized()
			global_position += direction * Speed * delta
			look_at(Finder.GetStrawberry().global_position)
	

func Hit(damage):
	if $HealthComponent.IsAlive() == false:
		return
	CurrentState = STATE.STOPPED
	$HitTimer.start()
	$AnimationPlayer.play("hit")
	$HealthComponent.TakeDamage(damage)
	Helper.AddText(str(damage) , global_position, true)


func _on_hit_timer_timeout() -> void:
	if $HealthComponent.IsAlive():
		CurrentState = STATE.MOVING
