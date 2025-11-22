extends Control

@onready var c_score = $VBoxContainer/CurrentScore
@onready var h_score = $VBoxContainer/HighScore


func _ready() -> void:
	EventController.connect('platform_scored', on_event_platform_scored)
	EventController.connect("high_score", high_score)
	
func on_event_platform_scored(value: int):
	c_score.text = 'Current Score: ' + str(value) 

func high_score(value: int):
	h_score.text = 'High Score: ' + str(value)
