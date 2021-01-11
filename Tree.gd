extends Control

var reset = []

func reset_nodes():
	var idx = 0
	for child in get_children():
		if child is Button:
			child.rect_position = reset[idx]
			child.update_lines()
			idx += 1
			child.pressed = false
			if child != $A: # A is the root of the tree and we want it enabled
				child.disabled = true

func _ready():
	$A.neighbors = [$B, $C]
	$B.neighbors = [$D, $E]
	$C.neighbors = [$F, $G]
	for child in get_children():
		if child is Button:
			reset.push_back(child.rect_position)
