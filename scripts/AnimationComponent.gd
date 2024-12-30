class_name AnimationComponent extends Node

@export var from_center: bool = true
@export var hover_scale: Vector2 = Vector2(1,1)
@export var hover_alpha: float = 0.5
@export var time: float = 0.5
@export var transition_type: Tween.TransitionType = Tween.TransitionType.TRANS_QUART
@export var transition_ease: Tween.EaseType = Tween.EaseType.EASE_OUT

var target: Control
var default_alpha: float
var default_scale: Vector2

func _ready() -> void:
	target = get_parent()
	connect_signals()
	call_deferred("setup") #defer setup call
	
func connect_signals() -> void:
	target.mouse_entered.connect(_on_hover)
	target.mouse_exited.connect(_off_hover)
	
func setup() -> void:
	if from_center:
		target.pivot_offset = target.size * 0.5
	default_scale = target.scale
	default_alpha = target.self_modulate.a
	
func _on_hover() -> void:
	print('on hover...')
	add_tween("scale", hover_scale, time)
	print(target.self_modulate.a, ' ... ',hover_alpha)
	#add_tween("self_modulate", {a = hover_alpha}, time)

func _off_hover() -> void:
	print('off hover...')
	add_tween("scale", default_scale, time)
	#add_tween("self_modulate.a", default_alpha, time)

func add_tween(property: String, value, seconds: float) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(target, property, value, seconds).set_trans(transition_type).set_ease(transition_ease)
	
