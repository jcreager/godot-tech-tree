extends Button

var neighbors = [] setget set_neighbors
var lines = []
var neighbor_lines = []
var delay = 10

func add_line(neighbor):
	var line = Line2D.new()
	line.width = 2
	line.z_index = -1
	line.add_point(rect_position + rect_size / 2)
	line.add_point(neighbor.rect_position + neighbor.rect_size / 2)
	lines.push_back(line)
	neighbor.neighbor_lines.push_back(line)
	get_parent().add_child(line)

func update_lines():
	for line in lines:
		line.set_point_position(0, rect_position + rect_size / 2)
	for line in neighbor_lines:
		line.set_point_position(1, rect_position + rect_size / 2)

func set_neighbors(new_neighbors):
	for neighbor in new_neighbors:
		if not neighbors.has(new_neighbors):
			add_line(neighbor)
	neighbors = new_neighbors

func _on_Button_toggled(button_pressed):
	if pressed and button_pressed:
		for neighbor in neighbors:
			neighbor.disabled = false

func _process(_delta):
	if Input.is_action_pressed("mouse_left") and is_hovered():
		delay -= 1
		if delay < 0:
			rect_position = get_global_mouse_position() - rect_size / 2 # Center mouse
			update_lines()
	if Input.is_action_just_released("mouse_left"):
		delay = 10
