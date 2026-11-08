extends RigidBody2D


const SPEED = 10.0

enum STATE {
	MOVING_UP,
	MOVING_RIGHT,
	MOVING_DOWN,
	MOVING_LEFT
}
const currentState := STATE.MOVING_RIGHT



func _physics_process(delta: float) -> void:
	# timer := $Timer
	# if (timer.isOff):
	#	position.x += x
	pass

func _on_timer_timeout() -> void:
	match currentState :
		STATE.MOVING_UP:
			position.y -= SPEED
		STATE.MOVING_RIGHT:
			position.x += SPEED
		STATE.MOVING_DOWN:
			position.y += SPEED
		STATE.MOVING_LEFT:
			position.x -= SPEED
