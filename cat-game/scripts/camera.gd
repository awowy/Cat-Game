extends Camera2D

@export var min_speed: float = 30.0
@export var max_speed: float = 90.0
@export var acceleration: float = 1

@onready var camera_triggered = false
var current_speed: float = 0.0
var _started: bool = false

func _ready() -> void:
	current_speed = min_speed

func _process(delta: float) -> void:
	if camera_triggered:
		move_camera(delta)

func trigger_camera(body: Node2D) -> void:
	camera_triggered = true

func move_camera(delta: float):
	current_speed = min(current_speed + acceleration * delta, max_speed)
	position.y -= current_speed * delta
	print(current_speed)
