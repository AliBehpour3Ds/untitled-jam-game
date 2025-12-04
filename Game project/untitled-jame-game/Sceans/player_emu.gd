extends CharacterBody2D


@export var speed : float = 50
var character_direction : Vector2


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	character_direction.x = Input.get_axis("move_left","move_right")
	character_direction.y = Input.get_axis("move_up","move_down")
	
	if character_direction:
		velocity = character_direction * speed * delta
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)

	#flip_sprite(character_direction)
	move_and_slide()

#
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot_button"):
		get_node("Gun").shoot()