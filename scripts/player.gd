extends CharacterBody2D


enum States {IDLE, WALKING}
var SPEED = 300
var state = States.IDLE

func change_state(new_state):
	state = new_state
	
func idle():
	if Input.is_action_pressed("up") or Input.is_action_pressed("down") or Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		change_state(States.WALKING)
	
func walking():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * SPEED
	if not input_direction:
		change_state(States.IDLE)

func _physics_process(delta):
	match state:
		States.IDLE:
			idle()
		States.WALKING:
			walking()
	move_and_slide()
	

