extends State

@export
var walk_state: State
@export
var jump_state: State

func enter() -> void:
	super() # call the parent event
	parent.velocity = Vector3(0, parent.velocity.y, 0)

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	if Input.get_axis("left", "right") != 0 or Input.get_axis("up", "down") != 0:
		return walk_state
	return null
	

func process_physics(delta: float) -> State:
	parent.velocity.y -= gravity * delta
	parent.move_and_slide()
	
	return null
