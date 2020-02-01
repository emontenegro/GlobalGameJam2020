extends StaticBody2D

export (PackedScene) var WeaponLeft

export (PackedScene) var WeaponRight

onready var game_timer: Timer = owner.get_node('GameTimer')

func _ready():
    game_timer.connect('timeout', self, '_on_Game_timeout')
    pass

func _on_Game_timeout() -> void:
    
    pass

func change_weapon(weapon: PackedScene, position: int) -> void:
    pass

