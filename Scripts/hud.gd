extends CanvasLayer
var player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	$expLabel.text = "EXP: " + str(player.experience_points)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_exp_change() -> void:
	$expLabel.text = "EXP: " + str(player.experience_points)
