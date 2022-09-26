extends KinematicBody

# variables for moving
var move_speed : float = 10.0
var side_speed : float = 6.0
var velocity : Vector3 = Vector3()
var jump_force : float = 40.0
var gravity : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	var sideways : int = 0
	if Input.is_action_pressed("move_left"):
		sideways = -1
	if Input.is_action_pressed("move_right"):
		sideways = 1
	if Input.is_action_just_pressed("jump"):
		velocity.y += jump_force
	velocity.z = -move_speed
	velocity.x = sideways * side_speed
	velocity.y -= gravity
	velocity = move_and_slide(velocity)
