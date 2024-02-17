extends Node2D

@export var radius: float
@export var color: Color
@export var point_count: int = 100


func _draw():
	var white : Color = Color.WHITE
	var godot_blue : Color = Color("478cbf")
	var grey : Color = Color("414042")

	draw_arc(Vector2.ZERO, radius, 0, TAU, point_count, color)
