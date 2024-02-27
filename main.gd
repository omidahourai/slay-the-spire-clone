extends Node

var CardDrawerNode: Node = load("res://card_drawer.tscn").instantiate()
var Card: PackedScene = load("res://card.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	deal_cards(7)
	#var card = Card.instantiate()
	#add_child(card)
	#card.position.x = Global.screen_center_x
	#card.position.y = Global.screen_center_y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func deal_cards(count):
	for i in count:
		print(i)
		draw_card(i)

func draw_card(index):
	var card = Card.instantiate()
	add_child(card)
	var mod = floor(index/5)
	var empty_card = CardDrawerNode.get_node(str("%EmptyCard",index+1))
	#var empty_card = CardDrawerNode.get_node(str("%EmptyCard1"))
	card.position.x = empty_card.position.x
	card.position.y = empty_card.position.y
	#card.position.x = index*(200+10) - (mod*index*(200+10))
	#$EmptyCard1.position.y = 110 + (mod * 250)
	#card.position.x = Global.screen_center_x
	#card.position.y = Global.screen_center_y
