extends KinematicBody2D
class_name Player


# Declare member variables here. Examples:
export var speed: float = 400
export var flap_speed: float = 400
export var gravity: float = 400

onready var sprite: AnimatedSprite = $AnimatedSprite
onready var bounds: StaticBody2D = get_parent().get_node("StaticBody2D")
onready var ground: Area2D = get_parent().get_node("Area2D")
onready var ground2: Area2D = get_parent().get_node("Area2D2")

onready var grounds = [ground, ground2]

onready var bounds_position: float = bounds.position.y

var motion: Vector2 = Vector2(speed, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	sprite.play(["blue", "green", "red", "yellow"][randi() % 4])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bounds.global_position.x = global_position.x
	if global_position.x - 2424 > grounds[0].global_position.x: 
		var back: Area2D = grounds.pop_front()
		grounds.append(back)
		back.global_position.x = grounds[0].global_position.x + 2424
	motion.y += gravity * delta
	if Input.is_action_just_pressed("ui_flap"): 
		motion.y = -flap_speed
	
	speed += delta
	
	motion = move_and_slide(motion)
