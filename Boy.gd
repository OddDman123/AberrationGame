class_name Player
extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var panic : float = 0
var panicMax : float = 100
var isPanicing : bool = false

var heldItem : Item
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	_movement(delta)
	if(!isPanicing and panic > 0):
		panic -= 0.1
	elif panic < panicMax:
		panic += 0.5
	move_and_slide()

func _movement(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
	
	var look_direction : Vector2 = Vector2(direction.x, -1 * direction.z)
	if look_direction != Vector2.ZERO:
		rotation.y = Vector2.ZERO.angle_to_point(look_direction)
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
