extends Control

@onready var panic_bar = $TextureProgressBar
@onready var boy = $"../../Boy"

# Called when the node enters the scene tree for the first time.
func _ready():
	panic_bar.value = boy.panic
	panic_bar.max_value = boy.panicMax


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	panic_bar.value = boy.panic
