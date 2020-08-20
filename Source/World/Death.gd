extends Area2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in get_overlapping_bodies(): 
		if body is Player: 
			if Score.score > Score.high_score: 
				Score.high_score = Score.score
			Score.score = 0
			get_tree().reload_current_scene()
