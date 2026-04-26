extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

signal stats_up(stat: String)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_atk_vel_button_pressed() -> void:
	stats_up.emit("atk_vel")

func _on_bpw_button_pressed() -> void:
	stats_up.emit("bpw")
