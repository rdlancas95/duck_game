extends Sprite2D

func _ready():
	#var grand_parent=get_node("../../Node2D")
	var parent_node = get_parent()
	var grand_parent = parent_node.get_parent()
	grand_parent.health_changed.connect(_on_node_2d_health_changed)

func _on_node_2d_health_changed():
	var start_position = Vector2(0, 0)  # Start at the hat's current local position
	var end_position = Vector2(0, -100)  # Move up 100 pixels relative to its current position
	var new_rotation = rotation
	var tween = create_tween()
	
	print("duck is happy")

	# Interpolate up
	tween.parallel().tween_property(self, "position", Vector2(0, -200), .5)
	tween.parallel().tween_property(self,"rotation", rotation + 2*PI, .5)
	# Interpolate back down, with a delay equal to the time it takes to move up
	tween.tween_property(self, "position", Vector2(0, -60), .5)

	
