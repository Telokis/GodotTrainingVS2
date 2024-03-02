extends CharacterBody2D

@export var SPEED: float = 40

@onready var area_2d: Area2D = %Area2D
@onready var health_component: HealthComponent = %HealthComponent


func _process(delta):
	var direction = get_direction_to_player()
	velocity = direction * SPEED
	move_and_slide()


func get_direction_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	
	if (player_node != null):
		return (player_node.global_position - global_position).normalized()
