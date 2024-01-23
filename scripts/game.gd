extends Node2D

@onready var start_position: Marker2D = $StartPosition
@onready var player: Player = $Player

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		
func _on_deathzone_body_entered(_body: Player) -> void:
	reset_player_position()

func _on_enemy_player_touch() -> void:
	reset_player_position()

func _on_crow_flight_touch_enemy_on_path() -> void:
	reset_player_position()

func reset_player_position() -> void:
	player.velocity = Vector2.ZERO
	player.global_position = start_position.global_position


