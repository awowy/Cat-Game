extends Node2D

@onready var move_msg = "res://scenes/movement_bubble.tscn"
@onready var insect_msg = "res://scenes/insect_bubble.tscn"
@onready var platform_msg = "res://scenes/platform_bubble.tscn"
@onready var player = $"../Player"

func _process(delta: float) -> void:
	if player != null:
		ManageMessage()
		return
	
func ManageMessage():
	var move_instance = move_msg.instantiate()
	move_instance.position.x = player.position.x + 10
	move_instance.position.y = player.position.y - 10
	add_child(move_instance)
