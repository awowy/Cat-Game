extends CharacterBody2D
class_name player

@onready var player_anim = $AnimatedSprite2D
@onready var sfx_jump = $sfx_jump
@onready var sfx_bonk = $sfx_bonk

var can_move := true

const MOVE_SPEED = 100
const JUMP_FORCE = 250
const GRAVITY = 500

func _physics_process(delta: float) -> void:
	if can_move == false:
		velocity.x = 0
		move_and_slide()
		return
	
	#Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	# Left-Right Movement
	var direction := Input.get_axis('Left', 'Right')
	if direction:
		velocity = Vector2(direction * MOVE_SPEED, velocity.y)
		player_anim.play('walk')
	else:
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)
		player_anim.play('idle')
	
	# Jump
	if Input.is_action_just_pressed('Up') and is_on_floor():
		velocity.y -= JUMP_FORCE
		sfx_jump.play() 
	
	# Direction
	if direction == 1:
		player_anim.flip_h = false
	elif direction == -1:
		player_anim.flip_h = true
	
	
	move_and_slide()
	if is_on_ceiling():
			sfx_jump.stop()
			sfx_bonk.play()
			
func freeze():
	can_move = false
	player_anim.play("idle")
	return can_move

func unfreeze():
	can_move = true
	return can_move
