extends Control
@onready var click = $click


var is_gameover = true

func _ready() -> void:
	visible = true

func _process(delta: float) -> void:
	if visible and not is_gameover:
		is_gameover = true






func _on_retry_pressed() -> void:
	click.play()
	await click.finished
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_home_pressed() -> void:
	click.play()
	await click.finished
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
