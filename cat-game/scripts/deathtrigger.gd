extends Area2D

func _ready():
	var death_area = get_node("../deathtrigger")
	death_area.body_entered.connect(_on_player_entered)

func _on_player_entered(body):
	if body.name == "Player":
		gameover()

func gameover():
	var go = get_parent().get_node("Gameover")
	go.visible = true
	go.process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
