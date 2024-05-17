extends Area2D
signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move right"):
		velocity.x +=1
	if Input.is_action_pressed("move left"):
		velocity.x -=1
	if Input.is_action_pressed("move up"):
		velocity.y -= 1
	if Input.is_action_pressed("move down"):
		velocity.y +=1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0

	if Input.is_action_pressed("talk"):
		$chat_bubble.show()
		$Sprite2D.show()


func _on_body_entered(body):
	hit.emit()
	#hide()
	#CollisionShape2D.set_deferred("disabled", true)
	pass # Replace with function body.
	
