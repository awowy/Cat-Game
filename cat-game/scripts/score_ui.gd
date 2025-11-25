extends Control

@onready var c_score = $VBoxContainer/CurrentScore
@onready var h_score = $VBoxContainer/HighScore


func _ready() -> void:
	EventController.connect("total_score", total_score_changed)
	EventController.connect("high_score", high_score)
	global_position = Vector2(0, 50)
	
func total_score_changed(value: int):
	c_score.text = 'Current Score: ' + str(value) 
	
func high_score(value: int):
	h_score.text = 'High Score: ' + str(value)
