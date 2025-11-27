extends Node

@onready var music := self

func play_music(stream):
	if music.stream != stream:
		music.stream = stream
		music.play()

func stop_music():
	music.stop()
