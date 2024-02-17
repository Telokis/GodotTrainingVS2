extends Node

@export var basic_enemy_scene: PackedScene
@export var spawn_radius: float = 400 # Viewport width is 640

@onready var timer = %Timer

func _ready():
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if (player == null):
		return
	
	# Select a random position based on 
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * spawn_radius)

	var enemy = basic_enemy_scene.instantiate() as Node2D
	get_parent().add_child(enemy)
	enemy.global_position = spawn_position
