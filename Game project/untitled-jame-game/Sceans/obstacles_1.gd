extends CharacterBody2D
# Obstecle script

var bullet = Bullet.new()

@onready var obstacle: CharacterBody2D = $"."
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var area_2d: Area2D = $Area2D
@onready var game_speed = GameManager.game_speed
@onready var moving_speed = GameManager.background_movment_speed
@export var obstacle_damage: float = 1

#
func _ready() -> void:
	connect_signals()
#
func _process(delta: float) -> void:
	obstacle_movment(delta)
	queue_free_obstacle()


#
func connect_signals() -> void:
	area_2d.connect("body_entered", take_damage)
	progress_bar.connect("value_changed", progress_bar_changed)

#
func take_damage(body: Node2D) -> void:
	if body is Bullet:
		progress_bar.value -= bullet.bullet_damage
		body.queue_free()

#
func progress_bar_changed(value: float) -> void:
	if value == 0:
		GameManager.add_score(100)
		queue_free()

#
func obstacle_movment(delta) -> void:
	obstacle.global_position.x -= moving_speed * game_speed * delta

#
func queue_free_obstacle() -> void:
	if obstacle.global_position.x <= -140:
		print("passed check")
		queue_free()
