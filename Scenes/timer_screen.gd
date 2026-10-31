extends Node2D
@onready var life_container: HBoxContainer = $Lifecontainer
@onready var life: TextureRect = $Lifecontainer/Life
@onready var life_2: TextureRect = $Lifecontainer/Life2
@onready var life_3: TextureRect= $Lifecontainer/Life3
@onready var life_4: TextureRect= $Lifecontainer/Life4
@onready var life_5: TextureRect= $Lifecontainer/Life5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time 
var current_level= Global.minigames_done + 1
func _ready() -> void:
	await Timer(3.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

	  

func _process(delta: float) -> void:
	match Global.lives:
		4:
			life.hide()
		3:
			life.hide()
			life_2.hide()
		2:
			life.hide()
			life_2.hide()
			life_3.hide()
		1:
			life.hide()
			life_2.hide()
			life_3.hide()
			life_4.hide()
		0:
			life_container.hide()
	timer.text = str(time)
	level.text= "Level " + str(current_level) 
func Timer(start_time: float):
	time= start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
