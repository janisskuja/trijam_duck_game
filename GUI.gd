extends Control


func _process(delta):
	$HBoxContainer/ScoreLabel.text = "SCORE: " + str(Global.score)
	$HBoxContainer/LevelLabel.text = "LEVEL: " + str(Global.current_level)
	$HBoxContainer/HealthLabel.text = "LIVES: " + str(Global.lives)
	