extends Node

@export var platform_scene: PackedScene

@onready var playerr := $"../Player"

@onready var floor_count:= 0
@onready var floor_index := 0
@onready var platform_floor := [0,0,0]
@onready var x_positions := [-77, 0, 77]
@onready var y_pos := -200

const FLOOR_HEIGHT = 75

func spawn_floor():
	for i in range(3):
		platform_floor[i] = randi() % 2
		if platform_floor[i] == 1:
			spawn_platform(x_positions[i], y_pos)
	if platform_floor == [0,0,0]:
		spawn_platform(x_positions[1], y_pos)
	floor_count += 1
	platform_floor = [0,0,0]
	y_pos -= FLOOR_HEIGHT

func spawn_platform(x_pos, y_pos):
	var platform = platform_scene.instantiate()
	platform.position = Vector2(x_pos, y_pos)
	platform.floor_index = floor_count
	add_child(platform)

func delete_floor(index_to_delete):
	for platform in get_children():
		if "floor_index" in platform:
			if platform.floor_index == index_to_delete:
				platform.queue_free()


func _process(delta):
	if playerr.position.y <= y_pos + 2*FLOOR_HEIGHT:
		spawn_floor()

	for i in range(max(0, floor_count - 10)):  # opsional, loop terakhir 10 floor
		delete_floor(i)
