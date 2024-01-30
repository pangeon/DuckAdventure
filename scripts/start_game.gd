class_name StartGame extends StaticBody2D

@onready var start: Marker2D = $StartPosition

func get_start_position() -> Vector2:
	return start.global_position
