extends Node2D

func _ready() -> void:
	load_game()

func load_game():
	var save_file = FileAccess.open("user://Save File.txt", FileAccess.READ)
	var json_str = save_file.get_line()
	if json_str != "":
		var json = JSON.new()
		var parse = json.parse(json_str)
		var h_score = json.data
		EventController.emit_signal("high_score", h_score)
	if json_str == "":
		EventController.emit_signal("high_score", 0)
