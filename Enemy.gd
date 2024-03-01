extends StaticBody3D

@onready var player_cam = $"../PlayerCam"
@onready var boy = $"../Boy"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	move_to_point(boy.global_position,delta)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(boy.global_position)
	

func move_to_point(point : Vector3, delta : float):
	global_position.x = move_toward(global_position.x,point.x,delta)
	global_position.z = move_toward(global_position.z,point.z,delta)

func _on_area_3d_body_exited(body):
#	if body is Player:
#		body.panic -= 1
#		body.isPanicing = false
	pass


func _on_area_3d_body_entered(body):
#	if body is Player:
#		body.panic += 1
#		body.isPanicing = true
	pass
