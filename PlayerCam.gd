extends Camera3D

@onready var boy = $"../Boy"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_followPlayer()

func _followPlayer():
	position = Vector3(boy.global_position.x,boy.global_position.y + 3, boy.global_position.z + 3)

	
