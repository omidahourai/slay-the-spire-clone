class_name Card extends StaticBody2D

var is_selected: bool

var thumbs = [
	preload("res://images/Card/card_thumb_sword.png"),
	preload("res://images/Card/card_thumb_shield.png"),
	preload("res://images/Card/card_thumb_bolt.png")
]

func _ready():
	SignalBus.card_deselect.connect(_on_card_deselect)
	$Highlight.visible = false
	is_selected = false
	#connect("input_event", _input_event)

func _show(params = {}):
	var data = params.data
	var disp = params.disp
	self.get_node("Title").text = data.name
	self.get_node("Description").text = data.description
	self.get_node("EnergyLabel").text = str(data.energy)
	self.get_node("Thumbnail").texture = thumbs[data.id-1]
	disp.add_child(self)
	position.x = params.x
	position.y = params.y
	super.show()
	
func _on_card_deselect():
	is_selected = false
	$Highlight.visible = false
	
func select(is_select: bool, deselect_all: bool = true):
	if deselect_all: SignalBus.card_deselect.emit()
	is_selected = is_select
	$Highlight.visible = is_select

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and Input.is_action_pressed("click"):
		select(!is_selected)
