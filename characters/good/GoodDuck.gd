extends Node2D

export(bool) var is_good = true

signal destoyed

func _ready():
	move();
	pass

func move():
	print(Global.current_speed)
	$Tween.interpolate_property(self, "position", Vector2(0, 0), Vector2(750, 0), Global.current_speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0)
	$Tween.start()
	
func destroy_the_duck():
	if (is_good):
		Global.score += 1 * Global.current_level
	if (!is_good):
		Global.score -= 1
		Global.lives -= 1
	queue_free()

func clicked_on_duck():
	if (!is_good):
		Global.score += 1 * Global.current_level
	if (is_good):
		Global.score -= 1
		Global.lives -= 1
	$Audio.play(0)
	queue_free()

func _on_Area2D_area_entered(body):
	if(body.is_in_group("destroy")):
		emit_signal("destroyed")
		destroy_the_duck()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		clicked_on_duck()
