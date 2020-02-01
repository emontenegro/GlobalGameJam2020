extends StaticBody2D

signal player_dies

export (int) var player

onready var game_timer: Timer = owner.get_node('GameTimer')

var current_health: int

func _ready():
    current_health = 100
    game_timer.connect('timeout', self, '_on_Game_timeout')
    owner.connect('p'+str(player)+'damage', self, '_on_Level1_player_hit')
    if player == 1:
        for state_node in owner.get_node('PlayerOneToolbox').get_children():
            state_node.connect("change_weapon", self, "_change_weapon")
    if player == 2:
        for state_node in owner.get_node('PlayerTwoToolbox').get_children():
            state_node.connect("change_weapon", self, "_change_weapon")
            
    hide_all_weapon()
    pass

func _on_Game_timeout() -> void:
    
    pass
    
func hide_all_weapon():
    for node in get_node("ArmR/weapon").get_children():
        node.hide()

func _change_weapon(weapon: String, player: int) -> void:
    hide_all_weapon()
    if player == self.player:
        if weapon != '':
            get_node("ArmR/weapon"+"/"+weapon).show()
        
    pass


func _on_Level1_player_hit(damage: int):
    current_health = current_health - damage
    current_health = clamp(current_health, 0, 100)
    print(current_health)
    if current_health <= 0:
        emit_signal("player_dies", player)
    pass
