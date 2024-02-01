class_name Background extends ParallaxBackground

@export var texture_file: CompressedTexture2D = preload("res://assets/textures/bg_sky_bigger.png")

@export var scroll_speed: int = 10

@onready var bg_texture: Sprite2D = $ParallaxLayer/BackgroundTexture

func _ready() -> void:
	bg_texture.texture = texture_file

func _process(delta) -> void:
	bg_texture.region_rect.position += delta * Vector2(scroll_speed, 0)
	
	if bg_texture.region_rect.position >= Vector2(32, 32):
		bg_texture.region_rect.position = Vector2.ZERO
		

