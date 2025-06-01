extends Node

var score : int = 0

# When called, increment score by some integer s.
func add_score(s : int) -> void:
	score += s
	print(score)
