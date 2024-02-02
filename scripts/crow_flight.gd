class_name Crow_Flight extends Path2D

signal touch_enemy_on_path

@onready var crow_flight_path: PathFollow2D = $CrowFlightPath
@onready var crow_sprite_animation: Area2D = $CrowFlightPath/Crow

func _ready() -> void:
	crow_flight_path.set_progress_ratio(0)

func _process(delta: float) -> void:
	crow_flight_path.progress_ratio += 0.2 * delta

func _on_crow_crow_touch() -> void:
	touch_enemy_on_path.emit()
