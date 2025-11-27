extends Node2D

func _ready() -> void:
	modulate.a = 0.0
	
	var start_anim = create_tween()
	start_anim.tween_property(self, "modulate:a", 1.0, 0.5)
	
	await get_tree().create_timer(5).timeout
	
	var exit_anim = create_tween()
	exit_anim.tween_property(self, "modulate:a", 0.0, 0.5)
	
	await exit_anim.finished
	queue_free()
