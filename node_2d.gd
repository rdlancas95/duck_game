extends Node2D

signal health_depleted
signal health_changed

var health = 10

func _ready():
	var buttonchar = get_node("Sprite2D/Button_char")
	buttonchar.pressed.connect(_on_Button_char_pressed)
	
func _on_Button_char_pressed():
	take_damage(1)

func take_damage(amount):
	var old_health = health
	health -= amount
	health_changed.emit(old_health, health)
	if health <= 0:
		health_depleted.emit()
		
