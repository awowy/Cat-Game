extends Node2D

var move_msg = preload("res://scenes/movement_bubble.tscn")
var insect_msg = preload("res://scenes/insect_bubble.tscn")
var platform_msg = preload("res://scenes/platform_bubble.tscn")
var message_spawned = false
@onready var player = $"../Player"

func _process(delta: float) -> void:
	if player != null and message_spawned == false:
		ManageMessage()
	
func ManageMessage():
	var move_instance = move_msg.instantiate()
	player.add_child(move_instance)
	move_instance.position = Vector2(25, -25)
	message_spawned = true
