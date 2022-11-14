extends Spatial

# onready vars
onready var player = $Player
onready var camera = $CameraHinge

# variables for roads
var initial_road_count : int = 5
var road_scenes = [
	load("res://scenes/Road1.tscn"),
	load("res://scenes/Road2.tscn"),
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(initial_road_count):
		var road = random_road()
		road.translation.z = -(i+1) * 50.0
		add_child(road)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.translation.z = player.translation.z
	camera.translation.y = 0
	camera.translation.x = player.translation.x / 2

# chooses random road
func random_road():
	var road_scene = road_scenes[randi() % road_scenes.size()]
	var road = road_scene.instance()
	return road
