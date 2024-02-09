class_name Game extends Node2D

@export var next_level: PackedScene = null

@onready var start_position: StaticBody2D = $StartGame
@onready var end_level_marker: Area2D = $FinishLevelMarker
@onready var player: Player = $Player
@onready var end_level_info: Control = $EndLevelMessage
@onready var deathzone: Area2D = $Deathzone
@onready var ui: CanvasLayer = $UI # contain nodes: HUD -> TimeDisplay

@export var time_to_complete_level: int = 0
var level_timer: Timer = Timer.new()
var remaining_time_to_complete_level: int = 0

var win: bool = false

func _ready() -> void:
	end_level_info.visible = false
	player.global_position = start_position.get_start_position()
	end_level_marker.body_entered.connect(_on_exit_body_entered)
	deathzone.body_entered.connect(_on_deathzone_body_entered)
	
	remaining_time_to_complete_level = time_to_complete_level
	ui.set_timer(remaining_time_to_complete_level)
	
	level_timer.name = "Level Time"
	level_timer.wait_time = 1
	level_timer.timeout.connect(_on_level_remaining_time_to_complete_timeout)
	add_child(level_timer)
	level_timer.start()

func  _on_level_remaining_time_to_complete_timeout() -> void:
	if win == false:
		remaining_time_to_complete_level -= 1
		ui.set_timer(remaining_time_to_complete_level)
		if remaining_time_to_complete_level < 0:
			reset_player_position()
			ui.set_timer(remaining_time_to_complete_level)

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
		win = true
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_packed(next_level)
	else:
		get_tree().quit()
	
func reset_player_position() -> void:
	player.velocity = Vector2.ZERO
	player.global_position = start_position.get_start_position()
	reset_time()

func reset_time() -> void:
	remaining_time_to_complete_level = time_to_complete_level
