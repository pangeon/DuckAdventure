extends Node2D

signal player_touch

func _on_enemy_area_body_entered(body: Player) -> void:
	if body is Player:
		player_touch.emit()
