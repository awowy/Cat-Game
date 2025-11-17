extends Node2D


@export var platform_scene: PackedScene
@onready var trigger_platform = $PlaceholderGround5
@onready var camera_pos = $Camera2D.position

const CAMERA_ZOOM = 3.76
const DISTANCE = 50
const LAYER_HEIGHT = 50

@onready var last_position = trigger_platform.position
@onready var center_x = trigger_platform.position.x
@onready var type = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func delete_platform(node):
	await get_tree().create_timer(10.0).timeout  # delay 5 detik
	if node and node.is_inside_tree():
		node.queue_free()
	

func spawn_platform(last_pos, type) -> Vector2:
	var platform = platform_scene.instantiate()
	platform.scale = trigger_platform.scale
	if type:
		platform.position = Vector2(center_x + DISTANCE, last_pos.y - LAYER_HEIGHT)
	else:
		platform.position = Vector2(center_x - DISTANCE, last_pos.y - LAYER_HEIGHT)
	self.add_child(platform)
	var last_position = platform.position
	delete_platform(platform)
	return last_position


func _trigger_area(_body: Node2D) -> void:
	while true:
		last_position = spawn_platform(last_position,type)
		type = not type
		await get_tree().create_timer(0.2).timeout  
