extends CharacterBody2D
class_name Bullet

@export var speed: int = 1000
@export var despawn_time: float = 1
@export var bullet_damage: float = 1
var target_position



func _ready() -> void:
	despawn()


func _physics_process(delta: float) -> void:
	velocity = target_position * speed * delta
	move_and_slide()


func despawn() -> void:
	await get_tree().create_timer(despawn_time).timeout
	queue_free()


