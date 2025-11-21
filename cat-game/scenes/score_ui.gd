extends Control

@onready var label = $RichTextLabel

func _ready() -> void:
	EventController.connect('platform_scored', on_event_platform_scored)
	
func on_event_platform_scored(value: int):
	label.text = 'Total Score: ' + str(value) 
