extends Camera3D

@export
var player: Player
@export
var idle_zone: CollisionShape3D
@export
var limits: CollisionPolygon3D

# logic

# cast a ray from center, if it intersects with idle zone, do nothing
# if it misses, lerp towards the player ( along local axis ) until back in zone
# when moving, cast from the edges and corners to check if camera goes into limits, if so, stop movement.
