class_name Player extends CharacterBody2D

@export var gravity: int = 400
@export var movement_speed: int = 125
@export var jump_power: int = 230

@onready var duck_animated_sprite: AnimatedSprite2D = $Duck

func _process(delta: float) -> void:
	var direction: int = 0
	
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_power
	
	direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		duck_animated_sprite.flip_h = (direction == -1)
	
	velocity.x = direction * movement_speed
	
	move_and_slide()
	update_animation(direction)
	
func update_animation(direction: int) -> void:
	if is_on_floor():
		if direction == 0:
			duck_animated_sprite.play("default")
		else:
			duck_animated_sprite.play("run")
	else:
		if velocity.y < 0:
			duck_animated_sprite.play("jump")
		else:
			duck_animated_sprite.play("default")



	
