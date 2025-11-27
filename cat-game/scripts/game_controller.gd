extends Node

var total_insects := 0
var total_score := 0
var has_played: bool

func _ready() -> void:
	EventController.connect("game_over", reset_score)
	EventController.connect("has_played", played)
	EventController.connect("game_over", reset_score)
	
func insect_collected(value: int):
	total_insects += value
	total_score += value * 10
	EventController.emit_signal('insect_collected', total_insects)
	EventController.emit_signal('total_score', total_score)

func platform_score():
	total_score += 1
	EventController.emit_signal("total_score", total_score)
	
func reset_score():
	total_insects = 0
	total_score = 0

func played():
	has_played = true
