extends StaticBody2D

@onready var camera_enter = $Camera2D
@onready var player_pos = $Player

func _on_area_2d_body_entered(body: Node2D) -> void
