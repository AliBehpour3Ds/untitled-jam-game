extends Node

@onready var main = $"../Main"
@onready var player_emu = $"../Main/player_emu"

@onready var master_volume: float = 80.0
@onready var music_enable: bool = true