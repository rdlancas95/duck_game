extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = get_node("../Button")
	print(button)
	button.pressed.connect(_on_button_press)
	self.visible = false

func _on_button_press():
	self.visible = not self.visible
