extends Control

func _on_start_button_pressed() -> void:
	print("start button pressed, moving to world0")
	get_tree().change_scene_to_file("res://world0.tscn")
