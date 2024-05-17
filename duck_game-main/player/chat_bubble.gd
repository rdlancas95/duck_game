extends Label
var texts = ['vloopda', 'zeep zhuu', 'Uhaeeha', 'Uhjaisa', 'gurgle da']

# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Replace with function body.
	self.visibility_changed.connect(_on_Visibility_changed)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Visibility_changed():
	if is_visible_in_tree():
		start_hide_timer()  # Start the timer to hide after showing
		text = texts[randi() % 5]

func start_hide_timer():
	print('timer')
	await get_tree().create_timer(2.0).timeout  # Create a timer that waits for 3 seconds
	print('timer over')
	hide()  # Hide the label after 3 seconds
