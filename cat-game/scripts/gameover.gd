extends Control

@onready var sfx_gameover = $gameoversound
@onready var click = $click

var is_gameover = false

func _ready() -> void:
	visible = false
	sfx_gameover.process_mode = Node.PROCESS_MODE_ALWAYS
	click.process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta: float) -> void:
	if visible and not is_gameover:
		sfx_gameover.play()
		is_gameover = true

func _on_retrybutton_pressed():
	click.play()
	await click.finished
	is_gameover = false
	get_tree().paused = false
	visible = false
	get_tree().reload_current_scene()

func _on_homebutton_pressed():
	click.play()
	await click.finished
	is_gameover = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
