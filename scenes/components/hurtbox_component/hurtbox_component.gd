class_name HurtboxComponent extends Area2D

@export var health_component: HealthComponent


func _ready():
	area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D):
	if not other_area is HitboxComponent:
		return
	
	if health_component == null:
		return
	
	var other_hitbox = other_area as HitboxComponent
	health_component.damage(other_hitbox.damage)
