class_name Player
extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var panic : float = 0
var panicMax : float = 100
var isPanicing : bool = false

@onready var item_pos = $ItemPos
var nearItems : Array[Item]
var heldItem : Item
var hasItem : bool = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	_movement(delta)
	if(!isPanicing):
		if panic > 0:
			panic -= 0.1
	elif panic < panicMax:
		panic += 0.5
	
	if Input.is_action_just_pressed("interact"):
		if heldItem == null:
			if nearItems.size() > 0:
				heldItem = nearItems[0]
				nearItems.erase(nearItems[0])
				hasItem = true
		else:
			heldItem.itemUse = !heldItem.itemUse
	
	if Input.is_action_just_pressed("drop"):
		heldItem = null
		hasItem = false
	
	if hasItem:
		heldItem.global_position = item_pos.global_position
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


func _on_item_search_body_entered(body):
	if body is Item:
		if body == heldItem:
			return
		nearItems.append(body)
		


func _on_item_search_body_exited(body):
	if body is Item:
		nearItems.erase(body)
