class_name Crow extends Area2D

signal crow_touch

func _on_body_entered(body) -> void:
	crow_touch.emit()
