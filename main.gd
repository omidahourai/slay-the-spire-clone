class_name Main
extends Node

const Card := preload("res://components/card/card.tscn")
const MAX_CARDS_IN_HAND: int = 10
var cards_in_hand: Array = []

var card_drawer: Node
var card_group: Node
var btn_card_deal: Node

var file = FileAccess.get_file_as_string("res://data/cards.json")
var data = JSON.parse_string(file)

# Called when the node enters the scene tree for the first time.
func _ready():
	card_drawer = %CardDrawer
	card_group = card_drawer.get_node("CanvasGroup")
	btn_card_deal = %BtnDrawCard
	deal_cards(randi_range(3,MAX_CARDS_IN_HAND))

func deal_cards(count: int):
	for i in count:
		draw_card()

func draw_card():
	var count = cards_in_hand.size()
	if (count >= MAX_CARDS_IN_HAND):
		print('Max cards already in hand.')
		return
	var card = Card.instantiate()
	cards_in_hand.append(card)
	var empty_card = card_drawer.get_node(str("%EmptyCard",count+1))
	card._show({
		disp = card_group,
		data = data[randi_range(0,data.size()-1)],
		x = empty_card.position.x,
		y = empty_card.position.y
	})
