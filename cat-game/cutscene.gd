extends Control

@export var fade_time: float = 1.5
@export var hold_time: float = 2.5
@export var skip_key: String = "ui_cancel"

@onready var skip_btn = $Skip
@onready var pics := [
	$pic1,
	$pic2,
	$pic3,
	$pic4
]
var tween_start = Tween
var tween_stop = Tween

func _ready() -> void:
	for idx in range(pics.size()):
		if pics[idx] == null:
			push_error("Cutscene.gd: node 'pic%d' not found. Check the node name and that the script is attached to the correct scene." % (idx + 1))

	
	for p in pics:
		if p:
			p.visible = true
			p.modulate.a = 0.0  

	if pics.size() > 0 and pics[0]:
		pics[0].modulate.a = 1.0  

	call_deferred("_run_sequence")


func _run_sequence() -> void:
	for i in range(pics.size() - 1):
		var cur = pics[i]
		var nxt = pics[i + 1]

		await wait_seconds(hold_time)

		var t = create_tween()
		if cur:
			t.tween_property(cur, "modulate:a", 0.0, fade_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		if nxt:
			t.tween_property(nxt, "modulate:a", 1.0, fade_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

		await t.finished

	await wait_seconds(hold_time)
	_cutscene_finished()


func wait_seconds(sec: float) -> void:
	await get_tree().create_timer(sec).timeout


func _input(event) -> void:
	if event.is_action_pressed(skip_key):
		_skip_cutscene()


func _skip_cutscene() -> void:
	for p in pics:
		if p:
			p.modulate.a = 0.0
	if pics.size() > 0 and pics[-1]:
		pics[-1].modulate.a = 1.0
	_cutscene_finished()


func _cutscene_finished() -> void:
	EventController.emit_signal("has_played")
	MusicPlayer.play_music(load("res://assets/audios/mp3musik.mp3"))
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	


func _on_skip_pressed() -> void:
	_cutscene_finished()

func _on_skip_mouse_entered() -> void:
	skip_btn.pivot_offset = skip_btn.size  / 2
	skip_btn.position = Vector2(397, 465)
	tween_start = create_tween()
	tween_start.tween_property(skip_btn, "scale", Vector2.ONE * 0.55, 0.3)
	
func _on_skip_mouse_exited() -> void:
	tween_start.kill()
	tween_stop = create_tween()
	tween_stop.tween_property(skip_btn, "scale", Vector2.ONE * 0.484, 0.3)
