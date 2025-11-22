extends Node2D

@onready var cam = $"../Camera2D"


@onready var trigger_platform = $"../Placeholder/PlaceholderGround5"
@onready var last_height = trigger_platform.position.y
@onready var last_bg_height = -313

@export var platform_scene: PackedScene
@export var bg_scene: PackedScene
@export var floor_height: int
@export var x_1: int
@export var x_2: int
@export var bg_height: int

@export var SPAWN_BUFFER: int
@export var BG_SPAWN_BUFFER: int


@onready var type = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var cam_top = cam.position.y - SPAWN_BUFFER

	while last_height > cam_top :
		last_height = spawn_platform(last_height, type)
		type = not type
	while last_bg_height > cam_top - BG_SPAWN_BUFFER:
		last_bg_height = spawn_background(last_bg_height)

func spawn_platform(last_height, type) -> float:
	var platform = platform_scene.instantiate()

	if type == true:
		platform.position = Vector2(x_1, last_height - floor_height)
	elif type == false:
		platform.position = Vector2(x_2, last_height - floor_height)

	add_child(platform)
	delayed_delete(platform)

	last_height = platform.position.y
	return last_height

func delayed_delete(node):
	await get_tree().create_timer(20.0).timeout
	if node and node.is_inside_tree():
		node.queue_free()

func spawn_background(last_bg_height):
	var bg = bg_scene.instantiate()
	bg.position = Vector2(4, last_bg_height - bg_height)
	
	add_child(bg)
	delayed_delete(bg)

	last_bg_height = bg.position.y
	return last_bg_height
