class_name HealthComponent extends Node

signal died

@export var max_health: float = 10
@onready var health = max_health


func damage(damage_amount: float):
	health = max(health - damage_amount, 0)
	Callable(check_death).call_deferred()


func check_death():
	if health == 0:
		died.emit()
		owner.queue_free()
