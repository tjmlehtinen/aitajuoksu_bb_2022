extends Spatial

# onready vars
onready var player = $Player
onready var camera = $CameraHinge

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.translation.z = player.translation.z
	camera.translation.y = 0
	camera.translation.x = player.translation.x / 2
