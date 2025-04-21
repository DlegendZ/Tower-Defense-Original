extends Node3D
@onready var timer = $Timer
@export var diff : Node3D
@export var HUD : MarginContainer

func _ready():
	#await get_tree().create_timer(4.5).timeout
	timer.start()
	
#func _process(delta):
	#print(timer.time_left)
	
func Summon_Enemy() :
	timer.start(diff.get_enemy_spawn())
	#timer.wait_time = diff.get_enemy_spawn()
	var enemy = preload("res://Scenes/enemy.tscn")
	var enemy_instances = enemy.instantiate()
	#print(enemy_instances.max_health)
	add_child(enemy_instances)
	enemy_instances.max_health = diff.get_enemy_health()
	enemy_instances.marginContainer = HUD
	await get_tree().create_timer(1.0).timeout
	
