extends Control

@onready var sfx_gameover = $gameoversound
@onready var click = $click

var is_gameover = true

func _ready() -> void:
	visible = true
	sfx_gameover.process_mode = Node.PROCESS_MODE_ALWAYS
	click.process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta: float) -> void:
	if visible and not is_gameover:
		sfx_gameover.play()
		is_gameover = true

func _on_retrybutton_pressed():
	click.play()
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_homebutton_pressed():
	click.play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
