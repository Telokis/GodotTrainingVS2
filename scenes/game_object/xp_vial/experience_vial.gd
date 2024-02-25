extends Node2D

@onready var area_2d = $Area2D

func _ready():
	area_2d.area_entered.connect(_on_area_entered)


func _on_area_entered(other_area: Area2D):
	GameEvents.emit_xp_vial_collected(1)
	queue_free()
