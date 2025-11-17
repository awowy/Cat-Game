extends Camera2D

const CAMERA_SPEED = 120

@onready var camera_triggered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if camera_triggered:
		move_camera(delta)



func trigger_camera(body: Node2D) -> void:
	camera_triggered = true

func move_camera(delta: float):
	position.y -= CAMERA_SPEED * delta
