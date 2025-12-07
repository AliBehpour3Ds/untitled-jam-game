extends Sprite2D

@onready var hud: Control = $"../../CanvasLayer/HUD"

@onready var target_marker: Marker2D = $Target_marker
@onready var marker_2d: Marker2D = $Marker2D
const BULLET = preload("uid://bxjbis3qhfwto")

func _process(delta: float) -> void:
	pass


func shoot() -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.position = marker_2d.global_position
	new_bullet.target_position = (target_marker.global_position - marker_2d.global_position).normalized()
	GlobalData.main.add_child(new_bullet)
