extends Sprite2D

func _init():
	print("Hello, world!")
	rotation = PI

var speed = 400
var angular_speed = PI

func _ready():
	var timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	var parent_node = get_parent()
	parent_node.health_changed.connect(on_health_changed)

func _on_timer_timeout():
	visible = not visible

func on_health_changed(old_health, new_health):
	var screenshake = true
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(.5,.5), .32)
	tween.tween_property(self, "scale", Vector2(1.5,1.5), .32)
	tween.tween_property(self, "scale", Vector2(1,1), .32)
	
	#tween.tween_property($Sprite2D, "scale", Vector2(2,2), 1)
	#tween.tween_property($Sprite2D, "scale", Vector2(1,1), 1)
	

func _process(delta):
	var direction = 0
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	rotation += angular_speed * direction * delta
	
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta


func _on_button_pressed():
	set_process(not is_processing())
