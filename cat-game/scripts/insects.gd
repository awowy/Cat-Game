extends Node2D

@onready var sfx_metalpipe = $sfx_metalpipe

var value = 1
var floor_index := 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		sfx_metalpipe.play()
		GameController.insect_collected(value)
		self.queue_free()
		
