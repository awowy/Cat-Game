extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body is player:
		timer.start()
	
func _on_timer_timeout():
	EventController.emit_signal("game_over")
	get_tree().change_scene_to_file("res://scenes/gameover.tscn")
