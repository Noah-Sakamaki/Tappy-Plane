extends Node


# Declare member variables here. Examples:
onready var pipe = preload("res://Pipe/Pipe.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1
	timer.start()
	timer.connect("timeout", self, "_spawn")


func _spawn() -> void: 
	var new_pipe = pipe.instance()
	get_tree().current_scene.add_child(new_pipe)
	new_pipe.global_position.x = get_tree().get_nodes_in_group("Camera")[0].global_position.x + 1024
	new_pipe.distance = 300
