extends Button

var scene: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	scene = self.get_owner()
	print(scene)
	print(scene.cards_in_hand)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	scene.draw_card()
