extends Node2D

@onready var sfx_metalpipe = $sfx_metalpipe

var value = 1
var floor_index := 0
var p_limiter = 100
var n_limiter = -100
var p_y_limiter = 50
var n_y_limiter = 0
var rngx = randi_range(n_limiter, p_limiter)
var rngy = randi_range(n_y_limiter, p_y_limiter)
var moves_left = abs(rngx)
var moves_y_left = abs(rngy)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		sfx_metalpipe.play()
		GameController.insect_collected(value)
		self.queue_free()
		

func _process(delta: float) -> void:
	if moves_left <= 0:
		rngx = randi_range(n_limiter, p_limiter)
		if rngx > 0:
			p_limiter -= rngx
		elif rngx < 0:
			n_limiter -= rngx
		if rngx == 0:
			p_limiter = 100
			n_limiter = -100
		moves_left = abs(rngx)
		
	if moves_y_left <= 0:
		rngy =  randi_range(n_y_limiter, p_y_limiter)
		if rngy > 0:
			p_y_limiter -= rngy
			n_y_limiter -= rngy
		elif rngy < 0:
			p_y_limiter += rngy
			n_y_limiter -= rngy
		moves_y_left = abs(rngx)
		
	else:
		if rngx > 0:
			position.x += 2*delta
		elif rngx < 0:
			position.x -= 2*delta
			
		if rngy > 0:
			position.y += 2*delta
		elif rngy < 0:
			position.y -= 2*delta
	moves_left -= 1
	moves_y_left -= 1
		
