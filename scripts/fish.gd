class_name Fish extends Area2D

signal fish_touch

func _on_body_entered(_body) -> void:
	fish_touch.emit()
