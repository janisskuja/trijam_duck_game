extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://screens/Main.tscn")
	Global.score = 0
	Global.lives = 3
	Global.current_speed = 3.0
	Global.current_level = 1
