extends KinematicBody2D
var speedx = 0
var speedy = 0
export var maxspeed = 5
export var acceleration = 0.2
export var friction = 0.09
export var rotationSpeed = 3
var direction = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up2"):
		speedy -= acceleration
		if speedy < maxspeed * -1:
			speedy = maxspeed * -1
	elif Input.is_action_pressed("down2"):
		speedy += acceleration
		if speedy > maxspeed:
			speedy = maxspeed
	elif speedy > 0: 
		speedy -= friction;
	elif speedy < 0:
		speedy += friction
		
	if Input.is_action_pressed("left2"):#		speedx -= acceleration
		rotation -= rotationSpeed * delta
	elif Input.is_action_pressed("right2"):#		speedx += acceleration
		rotation += rotationSpeed * delta
	if speedy > 1:
		speedy = 1
	var m = Vector2(0,speedy).rotated(rotation)
	move_and_collide(m.clamped(maxspeed))
