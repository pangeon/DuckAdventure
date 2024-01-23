extends Path2D

signal touch_enemy_on_path

@onready var crow_flight_path = $CrowFlightPath
@onready var crow_sprite_animation = $CrowFlightPath/Crow

func _ready():
	crow_flight_path.set_progress_ratio(0)

func _process(delta):
	crow_flight_path.progress_ratio += 0.2 * delta

func _on_crow_crow_touch():
	touch_enemy_on_path.emit()
