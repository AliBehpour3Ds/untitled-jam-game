extends Control

@onready var pause_menu: Control = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer


#
func _ready():
	pause_menu_visible(false)
	animation_player.play("RESET")

#
func pause_menu_visible(nool: bool):
	pause_menu.visible = nool

#
func pause():
	print("paused")
	get_tree().paused = true
	animation_player.play("Blur")


#
func resume():
	print("resume")
	pause_menu_visible(false)
	get_tree().paused = false
	animation_player.play_backwards("Blur")



#
func restart():
	print("restart")
	pause_menu_visible(false)
	get_tree().reload_current_scene()

#
func testEsc():
	if Input.is_action_just_pressed("pause_button") and !get_tree().paused:
		pause_menu_visible(true)
		pause()
	elif Input.is_action_just_pressed("pause_button") and get_tree().paused:
		pause_menu_visible(false)
		resume()



func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_restart_pressed() -> void:
	resume()
	restart()

func _on_resume_pressed() -> void:
	resume()

func _process(delta):
	testEsc()
