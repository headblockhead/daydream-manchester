extends Area2D

@export var target_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") and target_scene:
		print("portal w2to3: player _on_body_entered")
		get_tree().change_scene_to_packed(target_scene)
