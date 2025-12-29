extends Node2D


@onready var background_image: Sprite2D = $Background_image
@onready var background_image_2: Sprite2D = $Background_image2
@onready var game_speed = GameManager.game_speed
@onready var moving_speed = GameManager.background_movment_speed

func _process(delta: float) -> void:
	background_image.position.x -= moving_speed * game_speed * delta 
	background_image_2.position.x -= moving_speed * game_speed * delta

	if background_image.position.x < -432.15:
		background_image.position.x = 143.95
		
	if background_image_2.position.x < -432.15:
		background_image_2.position.x = 143.95
