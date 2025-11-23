extends Control

@onready var click = $click

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#testing func on main.tscn
func _on_play_pressed():
	click.play()
	await click.finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	
func _on_quit_pressed():
	click.play()
	await click.finished
	get_tree().quit()
