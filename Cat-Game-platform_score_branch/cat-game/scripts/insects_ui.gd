extends Control
@onready var label = $RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect('insect_collected', on_event_insect_collected)

func on_event_insect_collected(value: int):
	label.text = str(value)
