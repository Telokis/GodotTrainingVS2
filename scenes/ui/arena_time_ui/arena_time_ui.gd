extends CanvasLayer

@export var arena_time_manager: ArenaTimeManager

@onready var timer_label = %TimerLabel


func _process(delta):
	if (arena_time_manager == null):
		return
		
	var time_elapsed = arena_time_manager.get_time_elapsed()
	timer_label.text = format_seconds_to_string(time_elapsed)


func format_seconds_to_string(seconds: float):
	var minutes = floor(seconds / 60.0)
	var remaining_seconds = floor(seconds - (minutes * 60.0))
	
	return "%d:%02d" % [minutes, remaining_seconds]
