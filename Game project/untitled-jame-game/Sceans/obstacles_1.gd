extends CharacterBody2D

var bullet = Bullet.new()

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var area_2d: Area2D = $Area2D


func _ready() -> void:
	connect_signals()


func connect_signals() -> void:
	area_2d.connect("body_entered", take_damage)
	progress_bar.connect("value_changed", progress_bar_changed)


func take_damage(body: Node2D) -> void:
	if body is Bullet:
		progress_bar.value -= bullet.bullet_damage
		body.queue_free()

func progress_bar_changed(value: float) -> void:
	if value == 0:
		GameManager.add_score(100)
		queue_free()
