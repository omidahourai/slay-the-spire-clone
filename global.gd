extends Node

var hello = 'hi'
var screen_size: Vector2
var screen_width: int
var screen_center_x: int
var screen_height: int
var screen_center_y: int

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	screen_width = screen_size[0]
	screen_height = screen_size[1]
	screen_center_x = screen_width * 0.5
	screen_center_y = screen_height * 0.5
