extends State

@export
var idle_state: State
@export
var jump_state: State

func enter() -> void:
	super() # call the parent event
	
func process_input(event) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta) -> State:
	parent.velocity.y -= gravity * delta
	
	var input = Vector2.ZERO
	
	input.x = Input.get_axis('left', 'right') * move_speed
	input.y = Input.get_axis('up', 'down') * move_speed
	
	
	if input == Vector2.ZERO:
		return idle_state

	input = input.normalized() * move_speed

	parent.velocity.x = lerp(parent.velocity.x, input.x, 0.2)
	parent.velocity.z = lerp(parent.velocity.z, input.y, 0.2)
	parent.move_and_slide()
	
	return null
