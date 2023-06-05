extends HBoxContainer

func _ready():
	$value.text = str($slider.value)
	$slider.connect("value_changed", func(v):
		$value.text = str(v)
		get_node("/root/ui").canvas.grid.cover_size = v
	)
	
	$value.connect("text_submitted", func(t):
		$value.release_focus()
		$slider.value = int(t)
		get_node("/root/ui").canvas.grid.cover_size = int(t)
	)

func save_to_dictionary() -> Dictionary:
	return {
		"cover_size": $slider.value
	}

func load_from_dictionary(dict: Dictionary):
	$slider.value = dict.cover_size
