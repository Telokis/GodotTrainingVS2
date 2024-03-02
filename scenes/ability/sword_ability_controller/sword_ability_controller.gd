extends Node

@export var ability_range: float = 150
@export var spawn_range: float = 5

@export var sword_ability: PackedScene
var damage: int = 5

@onready var timer = %Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if (player == null):
		return
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	enemies = enemies.filter(func (enemy: Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) < pow(ability_range, 2)
	)
	
	if (enemies.size() == 0):
		return
	
	enemies.sort_custom(func (a: Node2D, b: Node2D):
		var a_distance = a.global_position.distance_squared_to(player.global_position)
		var b_distance = b.global_position.distance_squared_to(player.global_position)
		return a_distance < b_distance
	)
	
	var selected_enemy = enemies[0]
	
	var sword_instance = sword_ability.instantiate() as SwordAbility
	sword_instance.global_position = selected_enemy.global_position
	player.get_parent().add_child(sword_instance)
	sword_instance.hitbox_component.damage = damage
	
	# We take a random unit vector and multiply it by a random radius between 0 and spawn_range
	sword_instance.global_position += Vector2.RIGHT.rotated(randf_range(0, TAU)) * randf_range(0, spawn_range)

	var enemy_direction = selected_enemy.global_position - sword_instance.global_position
	sword_instance.rotation = enemy_direction.angle()
