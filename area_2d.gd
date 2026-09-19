extends Area2D

func _on_meaning(body: Node2D) -> void:
	if body.has_method("die"):
		get_tree().change_scene_to_file("res://meaning of life.tscn")
