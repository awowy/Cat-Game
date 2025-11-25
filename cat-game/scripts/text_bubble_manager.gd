extends Node2D

var move_msg = preload("res://scenes/movement_bubble.tscn")
var insect_msg = preload("res://scenes/insect_bubble.tscn")
var platform_msg = preload("res://scenes/platform_bubble.tscn")
var message_spawned = false
@onready var player = $"../Player"
@onready var window1 = $"../Placeholder/windowplatform"
@onready var window2 = $"../Placeholder/windowplatform2"
@onready var insect = $"../Insects"

func _ready() -> void:
	if player != null and message_spawned == false:
		ManageMessage()
		message_spawned == true
	
func ManageMessage():
		var move_instance = move_msg.instantiate()
		player.add_child(move_instance)
		move_instance.position = Vector2(25, -25)
		
		await move_instance.tree_exited
		
		var insect_instance = insect_msg.instantiate()
		player.add_child(insect_instance)
		insect_instance.position = Vector2(25, -25)
		
		await insect_instance.tree_exited
		
		var platform_instance = platform_msg.instantiate()
		player.add_child(platform_instance)
		platform_instance.position = Vector2(25, -25)
		
		await platform_instance.tree_exited
		return
