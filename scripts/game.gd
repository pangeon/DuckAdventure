class_name Game extends Node2D

@onready var start_position: StaticBody2D = $StartGame
@onready var end_level_marker: Area2D = $FinishLevelMarker
@onready var player: Player = $Player
@onready var end_level_info: Control = $Control

func _ready():
	end_level_info.visible = false
	player.global_position = start_position.get_start_position()
	end_level_marker.body_entered.connect(_on_exit_body_entered)

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

func _on_exit_body_entered(body: Player) -> void:
	if body is Player:
		end_level_info.visible = true
	
func reset_player_position() -> void:
	player.velocity = Vector2.ZERO
	player.global_position = start_position.get_start_position()
	







