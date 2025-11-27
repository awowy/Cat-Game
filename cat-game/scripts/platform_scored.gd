extends StaticBody2D
var is_touched := false
var value := 1
var floor_index := 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (is_touched == false) and body.velocity.y == 0:
		if body.current_floor < floor_index:
			body.current_floor += 1
			GameController.platform_score()
			is_touched = true
			return
	return
