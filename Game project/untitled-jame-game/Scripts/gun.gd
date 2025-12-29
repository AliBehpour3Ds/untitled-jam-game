extends Sprite2D

@onready var hud: Control = $"../../CanvasLayer/HUD"

# Gun Sound effects:
@onready var audio_fireing: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var loading_audio: AudioStreamPlayer2D = $Loading_audio

@onready var target_marker: Marker2D = $Target_marker
@onready var marker_2d: Marker2D = $Marker2D
const BULLET = preload("uid://bxjbis3qhfwto")


func _ready():
	_on_audio_stream_player_2d_finished()

func _process(delta: float) -> void:
	pass


func shoot() -> void:
	var new_bullet = BULLET.instantiate()
	new_bullet.position = marker_2d.global_position
	new_bullet.target_position = (target_marker.global_position - marker_2d.global_position).normalized()

	#
	audio_fireing.play()
	

	GlobalData.main.add_child(new_bullet)


func _on_audio_stream_player_2d_finished() -> void:
	loading_audio.play()
