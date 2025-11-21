extends StaticBody2D
var is_touched := false
var value := 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (is_touched == false) and (body.is_class('player')):
		print('+1 platform score')
		GameController.platform_scored(value)
		is_touched = true
		return
	return
