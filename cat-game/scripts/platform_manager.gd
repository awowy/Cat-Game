extends Node

@export var platform_scene_1: PackedScene
@export var platform_scene_2: PackedScene
@export var platform_scene_3: PackedScene

@export var collectibles_1: PackedScene
@export var collectibles_2: PackedScene

@onready var playerr := $"../Player"
@onready var platform_sprite := [platform_scene_1, platform_scene_2, platform_scene_3]
@onready var insect_sprite := [collectibles_1, collectibles_2]
@onready var floor_count:= 0
@onready var floor_index := 0
@onready var platform_floor := [0,0,0]
@onready var collectibles := [0,0,0]

@onready var x_positions := [-77, 0, 77]
@onready var y_pos := -200

const FLOOR_HEIGHT = 75

func spawn_floor():
	for i in range(3):
		platform_floor[i] = randi() % 4
		collectibles[i] = randi() % 3
		if platform_floor[i] > 0:
			spawn_platform(platform_floor[i] - 1, x_positions[i], y_pos)
			if collectibles[i] > 0:
				spawn_insect(collectibles[i] - 1, x_positions[i] - 5, y_pos - 10)
	if platform_floor == [0,0,0]:
		spawn_platform(1, x_positions[1], y_pos)
	floor_count += 1
	platform_floor = [0,0,0]
	y_pos -= FLOOR_HEIGHT

func spawn_platform(sprite, x_pos, y_pos):
	var platform = platform_sprite[sprite].instantiate()
	platform.position = Vector2(x_pos, y_pos)
	platform.floor_index = floor_count
	add_child(platform)

func delete_floor(index_to_delete):
	for platform in get_children():
		if "floor_index" in platform:
			if platform.floor_index == index_to_delete:
				platform.queue_free()

func spawn_insect(sprite, x_pos, y_pos):
	var insect = insect_sprite[sprite].instantiate()
	insect.position = Vector2(x_pos, y_pos)
	insect.floor_index = floor_count
	get_parent().add_child(insect)

func delete_insect(index_to_delete):
	for insect in get_parent().get_children():
		if "floor_index" in insect:
			if insect.floor_index == index_to_delete:
				insect.queue_free()

func _process(delta):
	if playerr.position.y <= y_pos + 2*FLOOR_HEIGHT:
		spawn_floor()

	for i in range(max(0, floor_count - 20)):  # opsional, loop terakhir 10 floor
		delete_floor(i)
		delete_insect(i)
