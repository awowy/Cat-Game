extends Node

var total_insects := 0
var total_score := 0

func insect_collected(value: int):
	total_insects += value
	total_score += value * 10
	EventController.emit_signal('insect_collected', total_insects)
	EventController.emit_signal('platform_scored', total_score)

func platform_scored(value: int):
	total_score += value
	EventController.emit_signal('platform_scored', total_score)
