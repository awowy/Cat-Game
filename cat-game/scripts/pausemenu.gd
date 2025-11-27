extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	self.visible = false
	Input.action_release("Pause")
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	self.visible = true
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("Pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("Pause") and get_tree().paused:
		resume()


func _on_resume_pressed():
	resume()

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()

func _process(_delta):
	testEsc()
