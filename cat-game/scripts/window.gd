extends Node2D

@onready var collisions = $"CollisionShape2D"

func EnableCollisions():
	collisions.set_deferred("disabled", false)
	
func DisableCollisions():
	collisions.set_deferred("disabled",true)
	
