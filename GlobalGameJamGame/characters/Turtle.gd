extends StaticBody2D

export (PackedScene) var WeaponLeft

export (PackedScene) var WeaponRight

onready var game_timer: Timer = owner.get_node('GameTimer')

func _ready():
    game_timer.connect('timeout', self, '_on_PoisonTimer_timeout')

