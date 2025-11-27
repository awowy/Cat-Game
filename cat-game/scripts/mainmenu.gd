extends Control
@export var tween_intensity: float
@export var tween_duration: float

@onready var click = $click
@onready var play_btn: TextureButton = $menupanel/Play
@onready var quit_btn: TextureButton = $menupanel/Quit
var tween_start: Tween
var tween_stop: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicPlayer.play_music(load("res://assets/audios/mp3musik.mp3"))

func _on_quit_pressed():
	click.play()
	await click.finished
	get_tree().quit()

func _on_play_pressed() -> void:
	click.play()
	await click.finished
	if GameController.has_played != true:
		MusicPlayer.play_music(load("res://assets/audios/Strings.wav"))
		get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
	elif GameController.has_played == true:
		get_tree().change_scene_to_file("res://scenes/main.tscn")

func spin_size_anim(button: TextureButton):
	tween_start = create_tween()
	tween_start.set_loops()
	tween_start.tween_property(button, "scale", Vector2.ONE * tween_intensity, tween_duration)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)
	tween_start.parallel().tween_property(button, "rotation_degrees", -10, tween_duration)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)
	
	tween_start.tween_property(button, "scale", Vector2.ONE * tween_intensity, tween_duration)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)
	tween_start.parallel().tween_property(button, "rotation_degrees", 10, tween_duration)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)

func hover_anim_handler(button: TextureButton):
	button.pivot_offset = button.size / 2
	spin_size_anim(button)

func exit_anim_handler(button: TextureButton):
	tween_start.kill()
	tween_stop = create_tween()
	tween_stop.tween_property(button, "scale", Vector2.ONE, tween_duration)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween_stop.parallel().tween_property(button, "rotation_degrees", 0, tween_duration)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _on_play_mouse_entered() -> void:
	hover_anim_handler(play_btn)

func _on_play_mouse_exited() -> void:
	exit_anim_handler(play_btn)

func _on_quit_mouse_entered() -> void:
	hover_anim_handler(quit_btn)
	
func _on_quit_mouse_exited() -> void:
	exit_anim_handler(quit_btn)
