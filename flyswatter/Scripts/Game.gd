extends Node2D

class_name Game

var Waves = []

var CurrentWave : BugGroup

signal RoundEnded 
signal RoundStarted

var bFirstWave = true


func _ready() -> void:
	Waves = Helper.GetAllFilePaths("res://Content/Waves/")
	SpawnNextWave()
	
func SpawnNextWave():
	
	if bFirstWave == false:
		RoundEnded.emit()
		await Finder.GetEndRoundUI().EndRoundAnimFinished
		
		
	if is_instance_valid(CurrentWave):
		CurrentWave.queue_free()
		
	if Waves.size() > 0:
		CurrentWave = load(Waves.pop_front()).instantiate()
		$Bugs.add_child(CurrentWave)
		CurrentWave.WaveComplete.connect(OnWaveComplete)
	else:
		print("Game Over")
		
	if bFirstWave == false:
		RoundStarted.emit()
		
	bFirstWave = false
	

func OnWaveComplete():
	SpawnNextWave()

func KillAllBugs():
	var bugs = Finder.GetBugs()
	for bug in bugs.get_children():
		bug.Hit(1000)

func _input(event: InputEvent) -> void:
	
	if Definitions.bIsDebug == false:
		return
	if event.is_action_pressed("f1_debug"):
		KillAllBugs()
