class_name Item
extends StaticBody3D

@export var item_effect : ItemEffect

var itemUse : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if itemUse:
		_itemEffect()

func _itemEffect():
	pass
