extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_quit_pressed():
	get_tree().quit()


func _on_playbutton_pressed() -> void:
	if GameController.has_played != true:
		get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
	elif GameController.has_played == true:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
