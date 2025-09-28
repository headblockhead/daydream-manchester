extends Control

func _on_start_button_pressed() -> void:
	print("button pressed")
	get_tree().change_scene_to_file("res://world0.tscn")
	pass # Replace with function body.
