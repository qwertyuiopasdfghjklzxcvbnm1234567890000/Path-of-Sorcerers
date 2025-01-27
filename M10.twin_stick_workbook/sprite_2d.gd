extends Sprite2D
const MOVE_UP := preload("res://player/godot_up.png")
const MOVE_DOWN := preload("res://player/godot_bottom.png")
const MOVE_RIGHT := preload("res://player/godot_right.png")
const MOVE_UP_RIGHT := preload("res://player/godot_up_right.png")
const MOVE_BOTTOM_RIGHT := preload("res://player/godot_bottom_right.png")

const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const UP_LEFT = Vector2.UP + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT
const DOWN_LEFT = Vector2.DOWN + Vector2.LEFT
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	var direction_discrete := input_direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			texture = MOVE_BOTTOM_RIGHT
		Vector2.UP:
			texture = MOVE_UP
		Vector2.DOWN:
			texture = MOVE_DOWN
		UP_RIGHT, UP_LEFT:
			texture = MOVE_UP_RIGHT
		DOWN_RIGHT, DOWN_LEFT:
			texture = MOVE_BOTTOM_RIGHT
	if direction_discrete.length() > 0:
		flip_h = direction_discrete.x < 0.0
