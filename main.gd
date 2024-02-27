extends Node

var card_scene: PackedScene = load("res://components/card/card.tscn")
var card_drawer: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	card_drawer = %CardDrawer
	deal_cards(randi_range(3,10))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func deal_cards(count):
	for i in count:
		draw_card(i)

func draw_card(index):
	var card = card_scene.instantiate()
	card_drawer.add_child(card)
	var mod = floor(index/5)
	card_drawer.position.y = 300
	var empty_card = card_drawer.get_node(str("%EmptyCard",index+1))
	card.position.x = empty_card.position.x
	card.position.y = empty_card.position.y

