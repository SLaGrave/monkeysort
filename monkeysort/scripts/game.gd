class_name Game extends Node2D

@export var level = 0:
	set = set_level

@onready var gui = %GUI
@onready var progress_bar = %ProgressBar
@onready var game_over_audio = $"Sound Effects (non-Box & non-Banan))/GameOver"

var sams_flag: bool = false

func _ready() -> void:
	Globals.mistake_made.connect(_on_mistake_made)
	Globals.score_increased.connect(_on_score_increased)
	%AnimationPlayer.play("walk")

func _process(delta: float) -> void:
	Globals.time_elapsed += delta
	#print(Globals.time_elapsed)
	progress_bar.value = Globals.time_elapsed
	if progress_bar.value >= progress_bar.max_value:
	#if progress_bar.value >= 10:
		win_level()

func _input(event):
	if event.is_action_pressed("close"):
		get_tree().quit()

func set_level(val: int):
	level = val
	Globals.reset()
	get_tree().call_group("banans", "queue_free")

func _on_score_increased():
	gui.add_good_text("Nice!")

func _on_mistake_made():
	if Globals._mistakes >= Globals.mistakes_allowed:
		restart_current_level()
	else:
		gui.add_bad_text("Mistake!")

func restart_current_level():
	# Restart the current level
	gui.add_bad_text("You Lost!")
	game_over_audio.play()
	# Delay the restart by 2 seconds
	var timer := Timer.new()
	timer.one_shot = true
	timer.wait_time = 2.0
	timer.timeout.connect(_restart_current_second_half)
	add_child(timer)
	timer.start()
	
func _restart_current_second_half():
	set_level(level)

func win_level():
	if sams_flag:
		return
	sams_flag = true
	gui.add_win_text("You won this level!\nOn to the next!")
	# Delay the restart by 2 seconds
	var timer := Timer.new()
	timer.one_shot = true
	timer.wait_time = 2.0
	timer.timeout.connect(_win_level_second_half)
	add_child(timer)
	timer.start()

func _win_level_second_half():
	sams_flag = false
	set_level(level+1)
