tool
extends Node2D


# Declare member variables here. Examples:
export var text: String
export var width: float = 60
export var zero: Texture = preload("res://Assets/PNG/Numbers/number0.png")
export var one: Texture = preload("res://Assets/PNG/Numbers/number1.png")
export var two: Texture = preload("res://Assets/PNG/Numbers/number2.png")
export var three: Texture = preload("res://Assets/PNG/Numbers/number3.png")
export var four: Texture = preload("res://Assets/PNG/Numbers/number4.png")
export var five: Texture = preload("res://Assets/PNG/Numbers/number5.png")
export var six: Texture = preload("res://Assets/PNG/Numbers/number6.png")
export var seven: Texture = preload("res://Assets/PNG/Numbers/number7.png")
export var eight: Texture = preload("res://Assets/PNG/Numbers/number8.png")
export var nine: Texture = preload("res://Assets/PNG/Numbers/number9.png")
export var high: bool
export var running: bool

var textures: Array = [zero, one, two, three, four, five, six, seven, eight, nine]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if running or not Engine.editor_hint: 
		for child in get_children(): 
			child.queue_free()
		
		var x: float = -len(text) / 2
		
		for character_index in len(text): 
			var sprite: Sprite = Sprite.new()
			add_child(sprite)
			sprite.texture = textures[int(text[character_index])]
			sprite.position.x = x * width
			x += 1
	
	if not Engine.editor_hint: 
		if high: 
			text = String(Score.high_score)
		else: 
			text = String(Score.score)
