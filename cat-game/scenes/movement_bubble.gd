extends Node2D

func _ready() -> void:
	modulate.a = 0.0
	var tween = create_tween()
	
	tween.tween_property(self, "modulate:a", 1.0, 0.5)
	
	await get_tree().create_timer(10).timeout
	
	var exit_tween = create_tween()
	exit_tween.tween_property(self, "modulate:a", 0.0, 0.5)
	await exit_tween.finished
	queue_free()
