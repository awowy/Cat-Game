extends Control
@onready var click = $click
@onready var msg_label = $GameOverMessage
@onready var file = FileAccess.open("res://Game_Over_Msg.txt", FileAccess.READ)
var is_gameover = true
var g_over_msg_list = []
@onready var tween_start: Tween
@onready var tween_end: Tween
@onready var retry_btn = $retry
@onready var home_btn = $home

func _ready() -> void:
	visible = true
	while not file.eof_reached():
		g_over_msg_list.append(file.get_line())
	var rng = RandomNumberGenerator.new().randi_range(0, len(g_over_msg_list) - 2)
	msg_label.text = g_over_msg_list[rng]
	
	
func _process(delta: float) -> void:
	if visible and not is_gameover:
		is_gameover = true
		

func _on_retry_pressed() -> void:
	click.play()
	await click.finished
	get_tree().paused = false
	visible = false
	MusicPlayer.play_music(load("res://assets/audios/mp3musik.mp3"))
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
	
func _on_home_pressed() -> void:
	click.play()
	await click.finished
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Mainmenu.tscn")
	
func hover_handler(button: TextureButton):
	tween_start = create_tween()
	tween_start.tween_property(button, "scale", Vector2.ONE * 0.48, 0.3)

func exit_handler(button: TextureButton):
	tween_start.kill()
	tween_end = create_tween()
	tween_end.tween_property(button, "scale", Vector2.ONE * 0.44, 0.3)
	
func _on_retry_mouse_entered() -> void:
	hover_handler(retry_btn)

func _on_retry_mouse_exited() -> void:
	exit_handler(retry_btn)

func _on_home_mouse_entered() -> void:
	hover_handler(home_btn)

func _on_home_mouse_exited() -> void:
	exit_handler(home_btn)
