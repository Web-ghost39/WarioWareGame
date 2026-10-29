extends Node2D
@onready var player: CharacterBody2D= $"../Player"
@onready var self_area= $Area2D
@onready var player_area= $"../Player/Area2D"

signal burger_collected




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_area.overlaps_area(self_area):
		if self.visible:
			emit_signal("burger_collected")
			self.hide()
