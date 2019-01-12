extends Node

export(PackedScene) var bad_duck
export(PackedScene) var good_duck

func _ready():
	$SpawnTimer.wait_time = Global.current_speed
	$SpawnTimer.start()
	$LevelTimer.wait_time = Global.increse_lvl_time
	$LevelTimer.start()

func _process(delta):
	if(Global.lives <= 0):
		get_tree().change_scene("res://screens/GameOver.tscn")

func spawn_duck():
	var luck = randi() % 11 + 1;
	if(luck < 6):
		var duck = good_duck.instance()
		$Spawn.add_child(duck)
	else:
		var duck = bad_duck.instance()
		$Spawn.add_child(duck)

func _on_Timer_timeout():
	spawn_duck()

func _increase_level():
	if(Global.current_speed > Global.min_speed):
		Global.current_level += 1
		Global.current_speed -= Global.decrease_speed