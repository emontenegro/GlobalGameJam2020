extends Button

signal change_weapon
signal repair_weapon

export (int) var Player = 1
export (int) var Weapon = 1
export (int) var Repair_Timeout = 0
export (int) var Damage = 0

export (String) var WeaponName = ''

var current_health: int= 0
var released: bool = false
var is_repearing = false
var is_active =  false
var is_destroyed = false

func _ready():
    var ss = 'p'+str(Player)+'w'+str(Weapon)
    owner.connect(ss+'r', self, '_on_repair')
    owner.connect(ss+'c', self, '_on_change')
    owner.connect('p'+str(Player)+'stop', self, '_on_stop_repair')
    owner.connect('p'+str(Player)+'damage', self, '_on_take_damage')
    owner.connect('p'+str(Player)+'wchanged', self, '_on_weapon_changed')
    
    current_health = 20
    $Texture/HealthProgress.value = current_health

func _on_repair():
    if $Timer.is_stopped():
        is_repearing = true
        
    if is_repearing and $Timer.is_stopped():
        $Timer.start()
    pass

func _on_timeout():
    if !is_destroyed:
        do_repair()
    pass

func do_repair() -> void:
    var new_health = current_health + Repair_Timeout
    current_health = clamp(new_health, 0, 100)
    $Texture/HealthProgress.value = current_health
    emit_signal("repair_weapon", WeaponName, current_health, Player)
    print_debug('Repair Weapon: '+ str(WeaponName) +' Curr: '+ str(current_health))

func _on_change():
    if !is_destroyed:
        stop_repair()
        is_active =  true
        emit_signal("change_weapon", WeaponName, Player) 
        print_debug('Change Weapon: '+ str(WeaponName) +' Curr: '+ str(current_health))

func _on_stop_repair():
    stop_repair()

func stop_repair():
    is_repearing = false
    if !$Timer.is_stopped():
        $'Timer'.stop()
        
func _on_weapon_changed():
    is_active = false
    
func _on_take_damage(damage: int):
    if is_active:
        var new_health = current_health - damage
        current_health = clamp(new_health, 0, 100)
        $Texture/HealthProgress.value = current_health
        if current_health == 0:
            is_destroyed = true
            emit_signal("change_weapon", '', Player) 
