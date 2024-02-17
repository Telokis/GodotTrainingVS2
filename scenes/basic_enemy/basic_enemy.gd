extends CharacterBody2D

@export var SPEED: float = 40

@onready var area_2d = %Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.area_entered.connect(_on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = get_direction_to_player()
	velocity = direction * SPEED
	move_and_slide()


func get_direction_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	
	if (player_node != null):
		return (player_node.global_position - global_position).normalized()


func _on_area_entered(other_area: Area2D):
	queue_free()
