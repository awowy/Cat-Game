extends StaticBody2D

@onready var collision = $CollisionShape2D

func EnableCollisions():
	collision.set_deferred("disabled", false)
	
func DisableCollisions():
	collision.set_deferred("disabled", true)
