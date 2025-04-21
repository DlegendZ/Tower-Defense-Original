extends PathFollow3D
@onready var animation_player = $AnimationPlayer
@onready var environment = get_tree().get_first_node_in_group("environment")
var marginContainer : MarginContainer
var max_health
@onready var current_health :
	set(Input_Health) :
		current_health = Input_Health
		#$Label3D.text = str(current_health)
		if current_health <= 0 :
			marginContainer.current_gold += 2
			queue_free()

func _ready():
	set_physics_process(false) 
	await get_tree().create_timer(1.0).timeout
	set_physics_process(true)
	current_health = max_health

func _physics_process(delta):
	if progress_ratio == 1 :
		animation_player.play("Gone")
		await get_tree().create_timer(1.0).timeout
		environment.current_health -= 5
		queue_free()
	else :
		progress += 1 * delta
		
