extends Node

@onready var wave: int = 1
@onready var score: int = 0
@onready var game_speed: float = 1.0
@onready var background_movment_speed: float = 50.0




func _ready() -> void:
	start_wave(wave)


#
func start_wave(w):
	wave = w
	print("Starting Wave: ", wave)


#
func next_wave():
	start_wave(wave + 1)

#
func add_score(amount):
	score += amount
	print(score)

#
func add_game_speed(amount):
	game_speed += amount
	print(game_speed)