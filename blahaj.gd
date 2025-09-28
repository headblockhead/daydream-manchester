extends CharacterBody2D

@export var player: CharacterBody2D
@export var SPEED: int = 300
@export var ACCELERATION: int = 500
@export var FRICTION: int = 400
const JUMP_VELOCITY = -400.0

const JUMP_THRESHOLD : float = 100

@export var nav_agent: NavigationAgent2D
@export var body: AnimatedSprite2D;

func _ready() -> void:
	nav_agent.path_desired_distance = 300.0
	nav_agent.target_desired_distance = sqrt(2*(32^2))
	nav_agent.path_max_distance = 500.0
	
func _physics_process(delta: float) -> void:
	var direction: Vector2 = nav_agent.get_next_path_position()-global_position
	change_direction(direction.x)
	set_movement_target()
	
	if not nav_agent.is_target_reached():
		if direction != Vector2.ZERO:
			velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta )
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		move_and_slide()

	if not is_on_floor():
		velocity += get_gravity() * delta

func set_movement_target() -> void:
	await get_tree().physics_frame
	nav_agent.target_position = player.position - Vector2(0,40)

func change_direction(direction: float) -> void:
	if sign(direction) == -1:
		body.flip_h = false
	elif sign(direction) == 1:
		body.flip_h = true	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	elif is_on_floor() && velocity.x == 0 && (position.x + JUMP_THRESHOLD < direction || position.x - JUMP_THRESHOLD > direction):
		velocity.y = JUMP_VELOCITY
