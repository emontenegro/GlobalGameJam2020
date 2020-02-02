extends StaticBody2D

signal player_dies

export (int) var player
export (int) var current_damage

onready var game_timer: Timer = owner.get_node('GameTimer')

var current_health: int
var is_finished = false

func _ready():
    current_damage = 1
    current_health = 100
    $HealthBar.value = current_health
    game_timer.connect('timeout', self, '_on_Game_timeout')
    owner.connect('p'+str(player)+'damage', self, '_on_Level1_player_hit')
    owner.connect('startgame', self, '_start_game')
    owner.connect('endgame', self, '_end_game')
    if player == 1:
        for state_node in owner.get_node('PlayerOneToolbox').get_children():
            state_node.connect("change_weapon", self, "_change_weapon")
    if player == 2:
        for state_node in owner.get_node('PlayerTwoToolbox').get_children():
            state_node.connect("change_weapon", self, "_change_weapon")
    hide_all_weapon()
    pass
    
func _start_game():
    $Body/AnimationPlayer.play("Attack")    

func _end_game():
    $Body/AnimationPlayer.play("idle")
    is_finished = true

func _on_Game_timeout() -> void:
    
    pass
    
func hide_all_weapon():
    for node in get_node("Body/ArmR/Weapon").get_children():
        node.hide()

func _change_weapon(weapon: String, player: int, damage: int) -> void:
    current_damage = damage
    if !is_finished:
        hide_all_weapon()
        if player == self.player:
            if weapon != '':
                get_node("Body/ArmR/Weapon/"+weapon).show()
                $Body/AnimationPlayer.play("SwapWeapon")
                yield($Body/AnimationPlayer,"animation_finished")
                $Body/AnimationPlayer.play("Attack")  
    pass


func _on_Level1_player_hit(damage: int):
    current_health = current_health - damage
    $Tween.interpolate_property($HealthBar, 'value', $HealthBar.value, current_health, 0.5)
    $Tween.start()
    if current_health <= 0:
        emit_signal("player_dies", player)
        $Body/AnimationPlayer.play("Tanim_defeat")
    pass
