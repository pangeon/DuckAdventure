class_name Background extends ParallaxBackground

@export var texture_file: CompressedTexture2D = preload("res://assets/textures/bg_sky.png")

@export var scroll_speed: int = 15

@onready var bg_texture: Sprite2D = $ParallaxLayer/BackgroundTexture

func _ready():
	bg_texture.texture = texture_file

func _process(delta) -> void:
	bg_texture.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
	
	if bg_texture.region_rect.position >= Vector2(32, 32):
		bg_texture.region_rect.position = Vector2.ZERO
		

