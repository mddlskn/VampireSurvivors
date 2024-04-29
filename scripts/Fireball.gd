extends RigidBody2D

var fireball : Weapons

#func _ready():
	#fireball.damage = 10
	#fireball.cooldown = 1
	#fireball.knockback = 1
	#
func sort_closest(a, b):
	return a.position < b.position

func get_closest_enemy():
	var enemies = get_tree().get_nodes_in_group("enemy")
	enemies.sort_custom(sort_closest)
	return enemies.front()

func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		body.damage(50)
	print(body.name)
