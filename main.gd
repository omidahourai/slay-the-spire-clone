extends Node

var card_scene: PackedScene = load("res://components/card/card.tscn")
var card_drawer: Node
var deal_card_button: Node
var cards_in_hand: Array = []
var MAX_CARDS_IN_HAND: int = 10

var file = FileAccess.get_file_as_string("res://data/cards.json")
var data = JSON.parse_string(file)

# Called when the node enters the scene tree for the first time.
func _ready():
	card_drawer = %CardDrawer
	deal_card_button = %DrawCardButton
	deal_cards(randi_range(3,MAX_CARDS_IN_HAND))

func deal_cards(count):
	for i in count:
		draw_card(i)

func draw_card(index):
	var card = card_scene.instantiate()
	card_drawer.add_child(card)
	cards_in_hand.push_back(card)
	var mod = floor(index/5)
	
	var card_data = data[randi_range(0,data.size()-1)]
	card.get_node("Title").text = card_data.name
	card.get_node("Description").text = card_data.description
	card.get_node("Energy/EnergyLabel").text = str(card_data.energy)
	var empty_card = card_drawer.get_node(str("%EmptyCard",index+1))
	card.position.x = empty_card.position.x
	card.position.y = empty_card.position.y

func _on_draw_card_button_pressed():
	var count = cards_in_hand.size()
	print('pre-draw: ',count)
	if (count < MAX_CARDS_IN_HAND):
		draw_card(count)
		count = cards_in_hand.size()
		print('post-draw: ', count)
	else:
		print('Max cards already in hand.')
	#pass # Replace with function body.
