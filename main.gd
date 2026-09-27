extends Node2D
var current_number = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	current_number += 1
	$Button.text = str(current_number)
	
	var screen_size = get_viewport_rect().size
	var button_size = $Button.size
	
	var max_x = screen_size.x - button_size.x
	var max_y = screen_size.y - button_size.y
	
	$Button.position = Vector2(
		randf_range(0, max_x),
		randf_range(0, max_y)
	)
