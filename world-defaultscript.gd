extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("backspace"):
		print("backspace pressed, resetting")
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("esc"):
		print("esc pressed, going to title")
		get_tree().change_scene_to_file("res://TitleScreen/title_screen.tscn")
