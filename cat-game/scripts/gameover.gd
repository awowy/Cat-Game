extends Control



var is_gameover = true

func _ready() -> void:
	visible = true

func _process(delta: float) -> void:
	if visible and not is_gameover:
		is_gameover = true

func _on_retrybutton_pressed():
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_homebutton_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
