extends Node

#
const SPAWNER = preload("uid://18bhe4aek03o")

#
@onready var wave: int = 1
@onready var score: int = 0
@onready var game_speed: float = 1.0
@onready var background_movment_speed: float = 50.0

#
@onready var min_emus: int = 5
@onready var max_spawn_time: float = 1




func _ready() -> void:
	start_wave(wave)


#
func start_wave(w):
	wave = w

	# var max_emus_spawn: int = min_emus * wave
	# var spawn_interval: float = max_spawn_interval - (wave *  0.1)

	# SPAWNER.start_round(wave, max_emus_spawn, spawn_interval)
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