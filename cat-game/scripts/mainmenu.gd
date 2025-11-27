extends Control
@onready var click = $click
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
