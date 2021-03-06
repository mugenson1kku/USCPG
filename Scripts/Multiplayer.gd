extends Spatial


onready var player_pos_1 = $Spawn1
onready var player_pos_2 = $Spawn2


func _ready():
	var player1 = preload("res://Scenes/MPPlayer2.tscn").instance()
	player1.set_name(str(get_tree().get_network_unique_id()))
	player1.set_network_master(get_tree().get_network_unique_id())
	player1.global_transform = player_pos_1.global_transform
	add_child(player1)
	
	var player2 = preload("res://Scenes/MPPlayer2.tscn").instance()
	player2.set_name(str(GameRun.user_id))
	player2.set_network_master(GameRun.user_id)
	player2.global_transform = player_pos_2.global_transform
	add_child(player2)


func _process(delta):
	if GameRun.show_counter == 0:
		$FPSCounter.hide()
	if GameRun.show_counter == 1:
		$FPSCounter.show()
