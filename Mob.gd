extends KinematicBody

class_name Mob

##
## This is a test documentation
##
## @desc:
##		More docs!
##
## @tutorial:	https://sometutorial.com
##

export var min_speed = 10.0
export var max_speed = 18.0

var velocity = Vector3.ZERO

func _physics_process(_delta):
	move_and_slide(velocity)
	
## Initialize the mob on the given position and moving toward the player.
func initialize(start_position: Vector3, player_position: Vector3):
	translation = start_position
	look_at(player_position, Vector3.UP)
	rotate_y(rand_range(-PI / 4.0, PI / 4.0))
	
	var random_speed = rand_range(min_speed, max_speed)
	velocity = Vector3.FORWARD * random_speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)

func _on_VisibilityNotifier_screen_exited():
	queue_free()
