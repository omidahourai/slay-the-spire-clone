class_name DrawCardButton extends Button

var is_enabled := false

# Called when the node enters the scene tree for the first time.
func _ready():
	print('btn ready')
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_enabled:
		print('button enabled')
	else:
		print('button disabled')
