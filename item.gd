class_name Item
extends StaticBody3D

@export var item_effect : ItemEffect
@export var interactArea : Area3D

signal pickup(Item)
# Called when the node enters the scene tree for the first time.
func _ready():
	interactArea.body_entered.connect(Callable(_on_interact_entered))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_interact_entered(body):
	if body is Player:
		print("In zone")

