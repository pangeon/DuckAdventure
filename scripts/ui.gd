class_name UI extends CanvasLayer

@onready var timer: Label = $HUD/TimeDisplay
@onready var main_menu: Control = $StartMenu

func _ready() -> void:
	jukebox.play_music("res://assets/audio/start_soundtrack.wav", -20, "Start melody")
	hide_timer()

func set_timer(remaining_time: int) -> void:
	timer.text = "TIME: " + str(remaining_time)

func show_timer() -> void:
	timer.visible = true

func hide_timer() -> void:
	timer.visible = false
	
func show_main_menu() -> void:
	main_menu.visible = true

func hide_main_menu() -> void:
	main_menu.visible = false

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_exit_button_pressed():
	get_tree().quit()

