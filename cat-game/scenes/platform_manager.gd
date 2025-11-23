<<<<<<< Updated upstream
extends Node2D

@onready var cam = $"../Camera2D"


@onready var trigger_platform = $"../Placeholder/PlaceholderGround5"
@onready var last_height = trigger_platform.position.y
@onready var last_bg_height = -315

@export var platform_scene: PackedScene
@export var bg_scene: PackedScene
@export var bg_height: int

@export var SPAWN_BUFFER: int
@export var BG_SPAWN_BUFFER: int

var moveable_bg1: Node
var moveable_bg2: Node
var plat_list_set1 = []
var plat_list_set2 = []
var x_coordinates = [-77, 0 ,77]
var y_coordinates = [-30, -120, -240, -330]
var n_plats = 6



func _ready() -> void:
	moveable_bg1 = bg_scene.instantiate()
	moveable_bg2 = bg_scene.instantiate()
	add_child(moveable_bg1)
	add_child(moveable_bg2)
	moveable_bg1.position.x = 4
	moveable_bg2.position.x = 4
	moveable_bg1.position.y = -1000 
	moveable_bg2.position.y = -1000
	spawn_platform()
	place_platform1(0)
	place_platform2(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var cam_top = cam.position.y + 100
	if cam_top <= last_bg_height:
		moveable_bg1.position.y = last_bg_height
		moveable_bg2.position.y = last_bg_height - bg_height
		place_platform1(last_bg_height)
		last_bg_height -= bg_height
		place_platform2(last_bg_height)


func spawn_platform() -> void:
	
	# two set of platforms is needed for this
	for i in range(n_plats): # How many platforms do you need?
		var platform = platform_scene.instantiate()
		add_child(platform)
		platform.position = Vector2(-300 * (i + 1), 300 * i) # random position so as to not block anything
		plat_list_set1.append(platform)
		
	for j in range(n_plats):
		var platform = platform_scene.instantiate()
		add_child(platform)
		platform.position = Vector2(-300 * (j + 1), 300 * j) # random position so as to not block anything
		plat_list_set2.append(platform)


func place_platform1(last_h):
	var spawn_points1 = [[0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]]
	for i in range(4): # set the vertical plats first, here there's always 3
		var random_x = RandomNumberGenerator.new().randi_range(0, 2)
		plat_list_set1[i].global_position.y = y_coordinates[i] + last_h
		plat_list_set1[i].global_position.x = x_coordinates[random_x]
		spawn_points1[i][random_x] = -1
		
	for j in range(n_plats - 3): # remaining positions
		var random_y = RandomNumberGenerator.new().randi_range(0, 2)
		if spawn_points1[random_y][j] != -1:
			plat_list_set1[3 + j].global_position.y = y_coordinates[random_y] + last_h
			plat_list_set1[3 + j].global_position.x = x_coordinates[j]
			spawn_points1[random_y][j] = -1
	print("Plat1")
	return last_h
	
	
func place_platform2(last_h):
	# second set of platforms..
	var last_h2 = last_h - 360
	var spawn_points2 = [[0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]]
	for i in range(3): # set the vertical plats first, here there's always 3
		var random_x = RandomNumberGenerator.new().randi_range(0, 2)
		plat_list_set2[i].global_position.y = y_coordinates[i] + last_h2
		plat_list_set2[i].global_position.x = x_coordinates[random_x]
		spawn_points2[i][random_x] = -1
	for j in range(n_plats - 3): # remaining positions
		var random_y = RandomNumberGenerator.new().randi_range(0, 2)
		if spawn_points2[random_y][j] != -1:
			plat_list_set2[3 + j].global_position.y = y_coordinates[random_y] + last_h2
			plat_list_set2[3 + j].global_position.x = x_coordinates[j]
			spawn_points2[random_y][j] = -1
		
	print(spawn_points2)
	print(":Plat2")
	print(plat_list_set2[0].global_position.y)
=======
extends Node

@export var platform_scene: PackedScene

@onready var player := 

@onready var floor_count:= 0
@onready var floor_index := 0
@onready var platform_floor := [0,0,0]
@onready var x_positions := [-77, 0, 77]
@onready var y_pos := -200

const FLOOR_HEIGHT = 50

func spawn_floor():
	for i in range(3):
		platform_floor[i] = randi() % 2
		if platform_floor[i] == 1:
			spawn_platform(x_positions[i], y_pos)
	if platform_floor = [0,0,0]:
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
	if player.position.y <= y_pos + 2*FLOOR_HEIGHT:
		spawn_floor()

	for i in range(max(0, floor_count - 10)):  # opsional, loop terakhir 10 floor
		delete_floor(i)
>>>>>>> Stashed changes
