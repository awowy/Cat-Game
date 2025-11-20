extends Node

var total_insects := 0

func insect_collected(value: int):
	total_insects += 1
	EventController.emit_signal('insect_collected', total_insects)
