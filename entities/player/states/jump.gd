extends State

@export
var idle_state: State
@export
var walk_state: State

@export
var jump_force: float = 5

func enter() -> void:
	super()
	parent.velocity.y = +jump_force

func process_physics(delta: float) -> State:
	parent.velocity.y -= gravity * delta
	
	var input = Vector2.ZERO
	
	input.x = Input.get_axis('left', 'right') * move_speed
	input.y = Input.get_axis('up', 'down') * move_speed

	input = input.normalized() * move_speed

	parent.velocity.x = lerp(parent.velocity.x, input.x, 0.2)
	parent.velocity.z = lerp(parent.velocity.z, input.y, 0.2)
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if input != Vector2.ZERO:
			return walk_state
		return idle_state
	
	return null
