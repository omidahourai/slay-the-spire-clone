class_name BtnCardDraw extends Node

var scene: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	scene = get_owner().get_owner()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	scene.draw_card()
