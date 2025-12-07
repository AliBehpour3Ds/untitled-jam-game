extends Control


@onready var final_score: Label = $"PanelContainer/VBoxContainer/Final Score"
@onready var final_time: Label = $"PanelContainer/VBoxContainer/Final Time"
@onready var final_record_panel: Control = $"."

# hud scene refrence:
@onready var hud: Control = $"../../CanvasLayer/HUD"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel_visible(false)
	GameManager.update_final_score.connect(_on_set_final_score)
	hud.update_final_record_time_signal.connect(_on_set_final_time)
	GameManager.show_final_record_panel.connect(_on_unhide_final_panel)


# Called every frame. 'delta' is the elapsed time since the previous frame.

# restarts the game
func restart():
	get_tree().reload_current_scene()

# quits the game
func quit():
	get_tree().quit()

# press to quit
func _on_quit_pressed() -> void:
	quit()

# setting finall panel visivlity
func panel_visible(nool: bool):
	final_record_panel.visible = nool

# press restart
func _on_retry_pressed() -> void:
	get_tree().paused = false
	restart()

# Updates the finall time and sccore:
func _on_set_final_score(score):
	# set final score:
	final_score.text = "Final Score: " + str(score)

# Updates the finall time and sccore:
func _on_set_final_time(record_time):
	# set final score:
	final_time.text = record_time

# Unhids the final panel
func _on_unhide_final_panel():
	panel_visible(true)
