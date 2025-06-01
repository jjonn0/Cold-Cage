extends CharacterBody2D

@export_category("Player Movement")
@export var speed : float = 150.0
@export var jump_height : float = 500
@export var gravity : float = 980
@export var air_resistance : float = 0.9

var friction : float = 0

@onready var player_sprite : AnimatedSprite2D = $PlayerSprite
@onready var stage : TileMapLayer = %Stage

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	
	# Check if the player is on the floor. Otherwise, apply gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		# Check if player is on the floor and hits the jump button.
		if Input.is_action_just_pressed("jump"):
			velocity.y = -jump_height
		# Check the friction value of the floor.
		friction = stage.get_friction(Vector2(position.x, position.y + 1))
	
	# Read left-right directional inputs.
	var input_dir : float = Input.get_axis("move_left", "move_right")
	
	# Check which direction the player wants to face. Apply a horizontal flip on the sprite if appropriate.
	if input_dir < 0:
		player_sprite.flip_h = true
	elif input_dir > 0:
		player_sprite.flip_h = false
	
	# Apply movement to the player.
	if is_on_floor():
		if input_dir:
			velocity.x = input_dir * speed
			player_sprite.set_animation("moving")
		else:
			velocity.x = lerp(velocity.x, input_dir * speed, delta * friction)
			player_sprite.set_animation("idle")
	else:
		velocity.x = lerp(velocity.x, input_dir * speed, delta * air_resistance)
	
	move_and_slide()
	
