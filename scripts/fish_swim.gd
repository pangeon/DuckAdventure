class_name Fish_Swim extends Path2D

signal touch_enemy_on_path

@onready var fish_swim_path: PathFollow2D = $FishSwimPath
@onready var fish_sprite_animation: Area2D = $FishSwimPath/Fish

func _ready() -> void:
	fish_swim_path.set_progress_ratio(0)

func _process(delta: float) -> void:
	fish_swim_path.progress_ratio += 0.07 * delta

func _on_fish_fish_touch():
	touch_enemy_on_path.emit()
