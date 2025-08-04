class_name State
extends Node

@export 
var move_speed: float = 10

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
#reference to the player this state controls
var parent: Player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
	
func process_frame(delta: float) -> State:
	return null
