extends Node2D

@onready var game_manager : Node = %GameManager
@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Upon pickup, add score and play pickup animation.
func _on_coin_pickup(body: Node2D) -> void:
	game_manager.add_score(100)
	animation_player.play("pickup")
