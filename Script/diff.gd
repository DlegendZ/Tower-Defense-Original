extends Node3D
@export var enemy_health_curve : Curve
@export var enemy_spawn_curve : Curve
@onready var timer = $Timer
@export_range(1,300) var game_length : float
@export var road : Path3D
@onready var level_completed_label = $"../HUD/Level_completed"


func _ready():
	timer.start(game_length)
	
func _physics_process(delta):
	var enemy = get_tree().get_nodes_in_group("Enemy")
	if road.timer.is_stopped() :
		if enemy.size() == 0 :
			level_completed_label.visible = true
		

func game_progress_ratio() :
	var time_left = timer.time_left
	var time_passed_ratio = 1 - (time_left / game_length)
	return time_passed_ratio

func get_enemy_health() :
	return enemy_health_curve.sample(game_progress_ratio())

func get_enemy_spawn() :
	return enemy_spawn_curve.sample(game_progress_ratio())

func level_completed() :
	road.timer.stop()
