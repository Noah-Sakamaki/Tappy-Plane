extends Area2D


# Declare member variables here. Examples:
export var distance: float = 0

onready var one: CollisionPolygon2D = $"1"
onready var two: CollisionPolygon2D = $"2"

onready var score: Area2D = $Area2D
onready var score_shape: CollisionShape2D = $Area2D/CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	one.position.y -= distance / 2
	two.position.y += distance / 2
	
	randomize()
	global_position.y = rand_range(200, 400)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in get_overlapping_bodies(): 
		if body is Player: 
			if Score.score > Score.high_score: 
				Score.high_score = Score.score
			Score.score = 0
			get_tree().reload_current_scene()
	
	for body in score.get_overlapping_bodies(): 
		if body is Player: 
			Score.score += 1
			score_shape.disabled = true
