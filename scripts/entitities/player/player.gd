extends CharacterBody2D

@onready var animplayer = $sprite/AnimationPlayer
@onready var animtree = $sprite/AnimationPlayer/AnimationTree
@export var movedata : PlayerMovementData
var _direction = Vector2.ZERO
var _last_direction = Vector2.ZERO

func _ready():
	animtree.active = true

func _physics_process(delta):
	move()
	move_and_slide()
	
func move():
	var _last_direction_bkp = _last_direction
	_direction = Input.get_vector("left", "right", "up", "down")
	_last_direction = _direction if _direction != Vector2.ZERO else _last_direction_bkp
	if _direction != Vector2.ZERO:
		#update_blend_pos()  Aguardando as animações
		#set_walking(true)   Aguardando as animações
		do_vel(movedata.accel)
	else:
		#set_walking(false)  Aguardando as animações
		do_vel(movedata.fric)
	
		
func do_vel(factor):
	
	velocity.x = lerp(velocity.x, _direction.x * movedata.SPEED, factor)
	velocity.y = lerp(velocity.y, _direction.y * movedata.SPEED, factor)
	
# TO DO - implementar a animação
#func set_walking(value):
	#animtree.set("parameters/conditions/is_walking", value)
	#animtree.set("parameters/conditions/idle", not value)
	#
#func update_blend_pos():
	#animtree["parameters/idle/blend_position"] = _direction
	#animtree["parameters/walk/blend_position"] = _direction
	#
