extends CharacterBody2D

@export var SPEED: float = 150
@export var acceleration_smoothing: float = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * SPEED
	
	velocity = velocity.lerp(target_velocity, 1.0 - exp(-delta * acceleration_smoothing))
	move_and_slide()


func get_movement_vector():
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
