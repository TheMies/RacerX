extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var number = 10

var item = preload("res://TestRigidBody.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(number):
		var i = item.instance()
		i.mass = x * 100
		add_child(i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
