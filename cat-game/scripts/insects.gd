extends Node2D
@onready var player = $"../Player"
@onready var sfx_metalpipe = $sfx_metalpipe

var value = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == player:
		sfx_metalpipe.play()
		GameController.insect_collected(value)
		self.queue_free()
		
