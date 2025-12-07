extends Node

# hud Signals: sends base_health and score value updates:
signal update_HUD(value: float)
signal update_HUD_score(score: int)

# final_record_panel Signals: sends the final score, and show final panel:
signal update_final_score(sccore: int)
signal show_final_record_panel()


#
@onready var wave: int = 1
@onready var score: int = 0
@onready var game_speed: float = 1.0
@onready var background_movment_speed: float = 50.0

#
@onready var base_health: float = 25.0

#
@onready var min_emus: int = 5
@onready var max_spawn_time: float = 1




func _ready() -> void:
	start_wave(wave)


#
func start_wave(w):
	wave = w
	print("Starting Wave: ", wave)


#
func add_score(amount):
	score += amount
	update_hud_score_signal(score)
	print(score)

#
func add_game_speed(amount):
	game_speed += amount
	print(game_speed)

func redeuce_health(amount: float):
	base_health -= amount
	update_hud_signal(base_health)
	print(base_health)

	if base_health <= 0:
		var value = score
		get_tree().paused = true
		# send a signal, show the final record panel
		update_final_record_score_signal(value)
		show_final_panel_signal()

# Updating the health bar (progress bar) value at hud scene.
func update_hud_signal(value: float):
	emit_signal("update_HUD", value)

# Updating the Score Lable at hud scene
func update_hud_score_signal(value: int):
	emit_signal("update_HUD_score", value)

# Updating the dinal_score Lable at final_record_panel scene
func update_final_record_score_signal(value: int):
	emit_signal("update_final_score", value)

# Unhides the final_record_panel scene
func show_final_panel_signal():
	emit_signal("show_final_record_panel")