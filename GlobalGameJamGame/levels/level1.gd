extends Node2D

signal player_hit

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

func _ready():
	$GameTimer.start()
	pass


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
		emit_signal('p1w1c')
	if event.is_action_pressed('p1w2c'):
		emit_signal("p1stop")
		emit_signal('p1w2c')
	if event.is_action_pressed('p1w3c'):
		emit_signal("p1stop")
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
		emit_signal('p2w1c')
	if event.is_action_pressed('p2w2c'):
		emit_signal("p2stop")
		emit_signal('p2w2c')
	if event.is_action_pressed('p2w3c'):
		emit_signal("p2stop")
		emit_signal('p2w3c')


func _on_GameTimer_timeout():
	emit_signal("player_hit")
	pass


func _on_Player1_player_dies():
	print("A player died!")
	$GameTimer.stop()
	pass # Replace with function body.
