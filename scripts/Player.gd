extends KinematicBody

# variables for moving
var move_speed : float = 10.0
var side_speed : float = 6.0

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
	translation.z -= move_speed * delta
	translation.x += sideways * side_speed * delta
