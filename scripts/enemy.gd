extends CharacterBody2D


enum States {WALKING, HURT, DEATH}
var SPEED = 100
var state = States.WALKING
@onready var health_box = $HealthBox

func damage(numero):
	health_box.HEALTH -= numero
	print(health_box.HEALTH)
	
	
func change_state(new_state):
	state = new_state
	
	
func walking():
	var direction = global_position.direction_to(get_tree().get_first_node_in_group("player").global_position)
	velocity = direction * SPEED


func _physics_process(delta):
	match state:
		States.WALKING:
			walking()
	move_and_slide()
	

