extends RigidBody2D

const TILE_SIZE = 40

enum STATE {
	MOVING_UP,
	MOVING_RIGHT,
	MOVING_DOWN,
	MOVING_LEFT
}
var currentState := STATE.MOVING_RIGHT



func _physics_process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	match currentState :
		STATE.MOVING_UP:
			position += Vector2.UP * TILE_SIZE

			if (Input.is_key_pressed(KEY_RIGHT)):
				currentState = STATE.MOVING_RIGHT
			if (Input.is_key_pressed(KEY_LEFT)):
				currentState = STATE.MOVING_LEFT
			if (Input.is_key_pressed(KEY_DOWN)):
				pass

		STATE.MOVING_RIGHT:
			position += Vector2.RIGHT * TILE_SIZE

			if (Input.is_key_pressed(KEY_DOWN)):
				currentState = STATE.MOVING_DOWN
			if (Input.is_key_pressed(KEY_UP)):
				currentState = STATE.MOVING_UP
			if (Input.is_key_pressed(KEY_LEFT)):
				pass
		STATE.MOVING_DOWN:
			position += Vector2.DOWN * TILE_SIZE

			if (Input.is_key_pressed(KEY_RIGHT)):
				currentState = STATE.MOVING_RIGHT
			if (Input.is_key_pressed(KEY_LEFT)):
				currentState = STATE.MOVING_LEFT
			if (Input.is_key_pressed(KEY_UP)):
				pass
			
		STATE.MOVING_LEFT:
			position += Vector2.LEFT * TILE_SIZE

			if (Input.is_key_pressed(KEY_DOWN)):
				currentState = STATE.MOVING_DOWN
			if (Input.is_key_pressed(KEY_UP)):
				currentState = STATE.MOVING_UP
			if (Input.is_key_pressed(KEY_RIGHT)):
				pass
