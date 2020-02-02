extends Node2D

signal p1w1r
signal p1w2r
signal p1w3r
signal p1w1c
signal p1w2c
signal p1w3c
signal p1stop

signal p2w1r
signal p2w2r
signal p2w3r
signal p2w1c
signal p2w2c
signal p2w3c
signal p2stop

signal startgame
signal endgame

signal p1damage
signal p2damage

signal p1wchanged
signal p2wchanged

func _ready():
	$Arena/Player1.connect("player_dies", self, '_end_game')
	$Arena/Player2.connect("player_dies", self, '_end_game')
	$AnimationPlayer.play("Start_Game")
	pass

func start_game():
	print('start game')
	emit_signal("startgame")
	$GameTimer.start()

func _input(event):
	if event.is_action_pressed('p1w1r'):
		emit_signal("p1stop")
		emit_signal('p1w1r')
	if event.is_action_pressed('p1w2r'):
		emit_signal("p1stop")
		emit_signal('p1w2r')
	if event.is_action_pressed('p1w3r'):
		emit_signal("p1stop")
		emit_signal('p1w3r')
	if event.is_action_pressed('p1w1c'):
		emit_signal("p1stop")
		emit_signal("p1wchanged")
		emit_signal('p1w1c')
	if event.is_action_pressed('p1w2c'):
		emit_signal("p1stop")
		emit_signal("p1wchanged")
		emit_signal('p1w2c')
	if event.is_action_pressed('p1w3c'):
		emit_signal("p1stop")
		emit_signal("p1wchanged")
		emit_signal('p1w3c')

	if event.is_action_pressed('p2w1r'):
		emit_signal("p2stop")
		emit_signal('p2w1r')
	if event.is_action_pressed('p2w2r'):
		emit_signal("p2stop")
		emit_signal('p2w2r')
	if event.is_action_pressed('p2w3r'):
		emit_signal("p2stop")
		emit_signal('p2w3r')
	if event.is_action_pressed('p2w1c'):
		emit_signal("p2stop")
		emit_signal("p2wchanged")
		emit_signal('p2w1c')
	if event.is_action_pressed('p2w2c'):
		emit_signal("p2stop")
		emit_signal("p2wchanged")
		emit_signal('p2w2c')
	if event.is_action_pressed('p2w3c'):
		emit_signal("p2stop")
		emit_signal("p2wchanged")
		emit_signal('p2w3c')

func _on_GameTimer_timeout():
	emit_signal("p1damage", $Arena/Player2.current_damage)
	emit_signal("p2damage", $Arena/Player1.current_damage)
	pass

func _end_game(player: int):
	emit_signal("endgame")
	$GameTimer.stop()
	print('player: '+str(player)+' died.')
