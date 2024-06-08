extends Node

var is_battling: bool = false

func _ready() -> void:
    battle_start.connect(on_battle_start)
    battle_end.connect(on_battle_end)
    
    
func on_battle_start() -> void:
    is_battling = true
    
    
func on_battle_end() -> void:
    is_battling = false
    

signal board_update()

signal baddie_win()
signal player_win()

signal battle_start()
signal battle_half()
signal battle_end()


signal mouse_enter_being_slot(being: BeingSlot)
signal mouse_exit_being_slot(being: BeingSlot)
