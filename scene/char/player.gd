extends CharacterBody2D


const SPEED = 300.0
var movement_speed = 200
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var animation_tree = $AnimationTree
@onready var animationState = animation_tree.get("parameters/playback")

func _physics_process(_delta):
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	velocity = mov.normalized()*movement_speed
	move_and_slide()
	
	if mov != Vector2.ZERO:
		animation_tree.set("parameters/run/blend_position", velocity)
		animation_tree.set("parameters/idle/blend_position", velocity)
		animationState.travel("run")
	else:
		animationState.travel("idle")
		


