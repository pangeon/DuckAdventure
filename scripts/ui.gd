class_name UI extends CanvasLayer

@onready var timer: Label = $HUD/TimeDisplay

func set_timer(remaining_time: int) -> void:
	timer.text = "TIME: " + str(remaining_time)
