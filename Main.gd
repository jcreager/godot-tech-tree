extends MarginContainer

func _ready():
	$ViewportContainer/Viewport.size = $ViewportContainer.rect_size

func _on_ViewportContainer_resized():
	$ViewportContainer/Viewport.size = $ViewportContainer.rect_size

func _on_HSlider_value_changed(value):
	$ViewportContainer/Viewport/Camera2D.zoom.x = value
	$ViewportContainer/Viewport/Camera2D.zoom.y = value

func _on_Button_pressed():
	$ViewportContainer/Viewport/Tree.reset_nodes()
