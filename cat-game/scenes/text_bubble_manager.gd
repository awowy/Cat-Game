extends Node2D

var move_msg = preload("res://scenes/movement_bubble.tscn")
var insect_msg = preload("res://scenes/insect_bubble.tscn")
var platform_msg = preload("res://scenes/platform_bubble.tscn")
@onready var player = $"../Player"

func _ready() -> void:
	if player != null and GameController.tutorial_completed == false:
		'''ManageMessage()'''
		GameController.tutorial_completed = true

func ManageMessage():
		var move_instance = move_msg.instantiate()
		player.add_child(move_instance)
		move_instance.position = Vector2(25, -25)
		get_tree().call_group("window", "DisableCollisions")
		get_tree().call_group("Insect", "DisableInsect")

		await move_instance.tree_exited

		var insect_instance = insect_msg.instantiate()
		player.add_child(insect_instance)
		insect_instance.position = Vector2(25, -25)
		get_tree().call_group("Insect", "EnableInsect")

		await insect_instance.tree_exited

		var platform_instance = platform_msg.instantiate()
		player.add_child(platform_instance)
		platform_instance.position = Vector2(25, -25)
		get_tree().call_group("window", "EnableCollisions")

		await platform_instance.tree_exited
		return
