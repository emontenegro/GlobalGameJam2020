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

func _ready():
	var ss = 'p'+str(Player)+'w'+str(Weapon)
	owner.connect(ss+'r', self, '_on_repair')
	owner.connect(ss+'c', self, '_on_change')
	owner.connect('p'+str(Player)+'stop', self, '_on_stop_repair')
	
	current_health = 20
	$Texture/HealthProgress.value = current_health

func _on_repair():
	if $Timer.is_stopped():
		is_repearing = true
		
	if is_repearing and $Timer.is_stopped():
		$Timer.start()
	pass

func _on_timeout():
	do_repair()
	pass

func do_repair() -> void:
	var new_health = current_health + Repair_Timeout
	current_health = clamp(new_health, 0, 100)
	$Texture/HealthProgress.value = current_health
	emit_signal("repair_weapon", WeaponName, current_health, Player)
	print_debug('Repair Weapon: '+ str(WeaponName) +' Curr: '+ str(current_health))

func _on_change():
	stop_repair()
	emit_signal("change_weapon", WeaponName, Player) 
	print_debug('Change Weapon: '+ str(WeaponName) +' Curr: '+ str(current_health))

func _on_stop_repair():
	stop_repair()

func stop_repair():
	is_repearing = false
	if !$Timer.is_stopped():
		$'Timer'.stop()
