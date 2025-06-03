extends Node3D
@onready var label_3d = $Label3D

var base_health = 100
var current_health :
	set(input_health) :
		current_health = input_health
		if current_health < 0 :
			current_health = 0
		label_3d.text = str(current_health)

func _ready():
	current_health = base_health
