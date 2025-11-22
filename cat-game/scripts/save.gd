extends Node

class_name Save
var score: int = 0
var h_score: int = 0

func _ready() -> void:
	EventController.connect("platform_scored", h_score_decider)
	EventController.connect("high_score", high_score)
func save_game(value: int):
	var save_file = FileAccess.open("res://Save File.txt", FileAccess.WRITE)
	var json_str = JSON.stringify(value)
	save_file.store_line(json_str)

func high_score(value: int):
	h_score = value

func h_score_decider(value: int):
	if h_score < value:
		h_score = value

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_game(h_score)
		get_tree().quit()
