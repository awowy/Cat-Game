extends StaticBody2D

@onready var camera = $"../Camera2D"
@onready var target = $"../CameraMoveOnTrigger"

var camera_tween: Tween

func _on_area_2d_body_entered(body: Node2D) -> void:
	var target_vector = Vector2(target.position.x, target.position.y)
	camera_tween = create_tween()
	camera_tween.tween_property(camera, 'global_position', target_vector, 2)
