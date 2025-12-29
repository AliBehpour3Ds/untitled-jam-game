extends Control

# final_record_signals: sends the final time
signal update_final_record_time_signal(time_string: String)


@onready var score: Label = $Score_panel/VBoxContainer/Score
@onready var t_ime: Label = $Score_panel/VBoxContainer/TIme
@onready var health_bar: TextureProgressBar = $Base_health_panel/VBoxContainer/Health_bar
@onready var timer: Timer = $Timer

@onready var total_time_in_secs: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.update_HUD.connect(_on_progress_bar_update_HUD)
	GameManager.update_HUD_score.connect(_on_score_lable_update_HUD)

# Updates base health progress bar:
func _on_progress_bar_update_HUD(base_health):
	print("Base Health is: ", base_health)
	health_bar.value = base_health

# Updates score lable:
func _on_score_lable_update_HUD(value):
	score.text = "Score: " + str(value)

# Record timer:
func _on_timer_timeout() -> void:
	total_time_in_secs += 1
	var m = int(total_time_in_secs / 60)
	var s = total_time_in_secs - m * 60
	t_ime.text = "Time: " + '%02d:%02d' % [m, s]

	# send the final time signal:
	update_final_time_signal("Final Time: " + t_ime.text)
	


func update_final_time_signal(final_time: String):
	emit_signal("update_final_record_time_signal", final_time)
