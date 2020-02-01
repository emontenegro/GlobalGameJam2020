extends Button

signal change_weapon
signal repair_weapon

export (int) var Repair_Timeout = 0
export (String) var WeaponName = ''

var current_health: int= 0
var released: bool = false

func _ready():
    current_health = 20
    $Texture/HealthProgress.value = current_health

func do_repair() -> void:
    var new_health = current_health + Repair_Timeout
    current_health = clamp(new_health, 0, 100)
    $Texture/HealthProgress.value = current_health
    emit_signal("repair_weapon", WeaponName, current_health)
    print_debug('Repair Weapon: '+ str(WeaponName) +' Curr: '+ str(current_health))

func _on_button_down():
    $'Timer'.start()
    released = false
    pass

func _on_button_up():
    $'Timer'.stop()
    $TimerRepair.stop()
    #if ($'Timer'.get_time_left() > 0):
    if (!released):
        released = false
        emit_signal("change_weapon", WeaponName)
        print_debug('Change Weapon')
    pass


func _on_timeout():
    released =  true
    _repair_timeout()
    pass
    
func _repair_timeout():
    $TimerRepair.start()


func _on_TimerRepair_timeout():
    do_repair()
    pass
