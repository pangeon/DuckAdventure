class_name Game extends Node2D

@export var next_level: PackedScene = null

@onready var start_position: StaticBody2D = $StartGame
@onready var end_level_marker: Area2D = $FinishLevelMarker
@onready var player: Player = $Player
@onready var end_level_info: Control = $Control
@onready var deathzone: Area2D = $Deathzone

func _ready():
	end_level_info.visible = false
	player.global_position = start_position.get_start_position()
	end_level_marker.body_entered.connect(_on_exit_body_entered)
	deathzone.body_entered.connect(_on_deathzone_body_entered)

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

func _on_fish_swim_touch_enemy_on_path():
	reset_player_position()

func _on_exit_body_entered(body: CharacterBody2D) -> void:
	if (body is Player) and (next_level != null):
		end_level_info.visible = true
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_packed(next_level)
	else:
		get_tree().quit()
	
func reset_player_position() -> void:
	player.velocity = Vector2.ZERO
	player.global_position = start_position.get_start_position()
	
