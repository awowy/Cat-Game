extends Control
var tween_start: Tween
var tween_stop: Tween
@onready var resume_game = $PanelContainer/VBoxContainer/Resume
@onready var restart = $PanelContainer/VBoxContainer/Restart
@onready var quit = $PanelContainer/VBoxContainer/Quit

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
	
func spin_size_anim(button: TextureButton):
	tween_start = create_tween()
	tween_start.set_loops()
	tween_start.tween_property(button, "scale", Vector2.ONE * 1.03, 0.3)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)
	tween_start.parallel().tween_property(button, "rotation_degrees", -10, 0.3)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)
	
	tween_start.tween_property(button, "scale", Vector2.ONE * 1.03, 0.3)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)
	tween_start.parallel().tween_property(button, "rotation_degrees", 10, 0.3)\
		.set_trans(tween_start.TRANS_SINE).set_ease(tween_start.EASE_IN_OUT)

func hover_anim_handler(button: TextureButton):
	button.pivot_offset = button.size / 2
	spin_size_anim(button)

func exit_anim_handler(button: TextureButton):
	tween_start.kill()
	tween_stop = create_tween()
	tween_stop.tween_property(button, "scale", Vector2.ONE, 0.3)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween_stop.parallel().tween_property(button, "rotation_degrees", 0, 0.3)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _on_quit_mouse_entered() -> void:
	hover_anim_handler(quit)
	
func _on_resume_mouse_entered() -> void:
	hover_anim_handler(resume_game)

func _on_restart_mouse_entered() -> void:
	hover_anim_handler(restart)
	

func _on_resume_mouse_exited() -> void:
	exit_anim_handler(resume_game)


func _on_restart_mouse_exited() -> void:
	exit_anim_handler(restart)


func _on_quit_mouse_exited() -> void:
	exit_anim_handler(quit)
