extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Energy/EnergyLabel.text = str(randi_range(0,4))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
