class_name PlayerController extends CharacterBody2D

signal updateMovingState(isMoving : bool)
var _movingLastFrame : bool = false
var _movingNow : bool = false
var _fallingLastFrame : bool = false
var _lastVelocity : Vector2

const SPEED = 700
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		_movingNow = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		_movingNow = false
	_UpdateMovingState()

	move_and_slide()

func _UpdateMovingState() :
	if velocity.x * _lastVelocity.x < 0 :
		updateMovingState.emit(_movingNow)
	if _fallingLastFrame != is_on_floor():
		updateMovingState.emit(_movingNow)
	if _movingLastFrame != _movingNow:
		updateMovingState.emit(_movingNow)
	_movingLastFrame = _movingNow
	_fallingLastFrame = is_on_floor()
	_lastVelocity = velocity
