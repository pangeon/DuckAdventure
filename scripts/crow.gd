extends Area2D

signal crow_touch

func _on_body_entered(body):
	crow_touch.emit()
