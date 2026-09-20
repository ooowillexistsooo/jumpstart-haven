extends CharacterBody2D

signal player_died

var is_dead = false

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

func die(): 
	if is_dead:
		return
	
	is_dead = true;
	emit_signal("player_died")
	
	set_physics_process(false)
	
	call_deferred("reload_level")

func reload_level():
	get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

@onready var animated_sprite = $AnimatedSprite2D

func _process(_delta) -> void:
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("lefet")
		print("hello ahem hem")
	
	elif Input.is_action_pressed("right"):
		animated_sprite.play("right")
		
	else:
		animated_sprite.play("idle")
