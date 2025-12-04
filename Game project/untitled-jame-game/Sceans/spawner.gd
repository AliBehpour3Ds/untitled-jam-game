extends Node2D

# Prefabs to spawn (Emu or obsticle)
@export var obstacle_prefab: PackedScene

# 2 Y points in space to chose a random Y-Postion between them to spawn the prefab.
@onready var y_point_top: Node2D = $y_point_top
@onready var y_point_bottom: Node2D = $y_point_bottom

#
@onready var point_top: Vector2 = y_point_top.global_position
@onready var point_buttom: Vector2 = y_point_bottom.global_position



func _ready() -> void:
	randomize()

# Prefab Spawner
func _on_timer_timeout() -> void:
	spawner(obstacle_prefab)


# Gets a random point postion inside of the two provided points (Vector2) (X will be fixed).
func get_random_point_inside(top_postion: Vector2, bottom_postion: Vector2) -> Vector2:
	var y_value: float = randf_range(top_postion.y, bottom_postion.y)
	var x_value: float = top_postion.x

	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	return random_point_inside

# Custom spawner:
func spawner(prefab) -> void:
	# Builds the prefab behind the scenes
	var prefab_instance: Node = prefab.instantiate()
	# Places the prefab in the scean tree so we can see it
	add_child(prefab_instance)

	# Get a random spawn postion (X value is fixed):
	var spawn_location: Vector2 = get_random_point_inside(point_top, point_buttom)
	# Set the random generaited postion for prefab_instance:
	prefab_instance.global_position = spawn_location




