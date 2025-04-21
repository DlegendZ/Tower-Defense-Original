extends MarginContainer
@onready var label = $Label
@export var beginner_gold : int = 50
@onready var current_gold :
	set(input_gold) :
		current_gold = input_gold
		label.text = "Gold : " + str(current_gold)

func _ready():
	current_gold = beginner_gold
