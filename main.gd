extends Node2D

const TOTAL_NUMBERS = 5
var next_number = 1


func _ready() -> void:
	for number in range(1, TOTAL_NUMBERS + 1):
		create_number_button(number)


func create_number_button(number: int) -> void:
	var button = Button.new()

	button.text = str(number)
	button.add_theme_font_size_override("font_size", 48)
	button.custom_minimum_size = Vector2(100, 100)

	var screen_size = get_viewport_rect().size
	var button_size = button.custom_minimum_size

	button.position = Vector2(
		randf_range(0, screen_size.x - button_size.x),
		randf_range(0, screen_size.y - button_size.y)
	)

	button.pressed.connect(_on_number_pressed.bind(number, button))

	add_child(button)


func _on_number_pressed(number: int, button: Button) -> void:
	if number != next_number:
		return

	button.queue_free()
	next_number += 1
