extends Control

@export var end_level_message: String 
@onready var text_label: Label = $TextLabel

func _ready():
	text_label.text = "CONGRATULATION\n END LEVEL" + str(end_level_message)
