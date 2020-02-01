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

func _ready():
    pass

#func _physics_process(delta):
##    print('physics_process: in')
#
#    if Input.is_action_pressed("p1w1"):
#        emit_signal('p1w1_p')
#    if Input.is_action_pressed("p1w2"):
#        emit_signal("p1w2_p")


func _input(event):
    if event.is_action_pressed('p1w1r'):
        emit_signal('p1w1r')
        emit_signal("p1stop")
    if event.is_action_pressed('p1w2r'):
        emit_signal('p1w2r')
        emit_signal("p1stop")
    if event.is_action_pressed('p1w3r'):
        emit_signal('p1w3r')
        emit_signal("p1stop")
    if event.is_action_pressed('p1w1c'):
        emit_signal('p1w1c')
        emit_signal("p1stop")
    if event.is_action_pressed('p1w2c'):
        emit_signal('p1w2c')
        emit_signal("p1stop")
    if event.is_action_pressed('p1w3c'):
        emit_signal('p1w3c')
        emit_signal("p1stop")

    if event.is_action_pressed('p2w1r'):
        emit_signal('p2w1r')
        emit_signal("p2stop")
    if event.is_action_pressed('p2w2r'):
        emit_signal('p2w2r')
        emit_signal("p2stop")
    if event.is_action_pressed('p2w3r'):
        emit_signal('p2w3r')
        emit_signal("p2stop")
    if event.is_action_pressed('p2w1c'):
        emit_signal('p2w1c')
        emit_signal("p2stop")
    if event.is_action_pressed('p2w2c'):
        emit_signal('p2w2c')
        emit_signal("p2stop")
    if event.is_action_pressed('p2w3c'):
        emit_signal('p2w3c')
        emit_signal("p2stop")
