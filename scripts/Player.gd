extends KinematicBody

# variables for moving
var move_speed : float = 10.0
var side_speed : float = 6.0
var velocity : Vector3 = Vector3()
var jump_force : float = 40.0
var gravity : float = 1.0

# variables for animation
var time : float = 0.0
var step_frequency : float = 2.0
var step_height : float = 0.2
var step_tilt : float = 8.0

# onready variables
onready var body_hinge = $BodyHinge

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	# animation
	var up_step : float = 1 + sin(2.0 * PI * step_frequency * time)
	body_hinge.translation.y = step_height * up_step
	var tilt : float = step_tilt * sin(PI * step_frequency * time)
	body_hinge.rotation_degrees.z = tilt
	time += delta
	# movement
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
	for index in range(get_slide_count()):
		var collision = get_slide_collision(index)
		var collision_object = collision.collider as CollisionObject
		if collision_object.get_collision_layer() & 4:
			get_tree().change_scene("res://scenes/Main.tscn")
