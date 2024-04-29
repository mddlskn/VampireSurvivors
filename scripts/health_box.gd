extends Node2D

@export var HEALTH := 100
# Called when the node enters the scene tree for the first time.
func _ready():
	HEALTH = 100


func damage(numero):
	HEALTH-= numero
	
	if HEALTH <= 0:
		get_parent().queue_free()
	
