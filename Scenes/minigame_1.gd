extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer

var burger_collected =0
var timer_end = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await themed_timer.Timer(10.0)
	timer_end = true

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if burger_collected == 4:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
			
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		if Global.lives < 1:
			get_tree().change_scene_to_file("res://Scenes/lose_screen.tscn")
			Global.lives = 5
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn")
		
 			
	
		
	 	
			

func burger_collect() -> void:
	burger_collected = burger_collected + 1
	return



	
