extends Control
class_name BeingInfo


func _ready() -> void:
    BattleEventBus.mouse_enter_being_slot.connect(on_mouse_enter_being_slot)
    BattleEventBus.mouse_exit_being_slot.connect(on_mouse_exit_being_slot)
    visible = false


func on_mouse_enter_being_slot(being_slot: BeingSlot) -> void:
    if !being_slot.being_stats.is_being_slot(): return
    
    $Panel/Texture.texture = being_slot.being_stats.texture
    $Panel/Texture.modulate = being_slot.being_stats.modulate
    
    $Panel/VBoxContainer/Speed.text = "Speed: " + str(being_slot.being_stats.speed)
    $Panel/VBoxContainer/Damage.text = "Damage: " + str(being_slot.being_stats.damage)
    $Panel/VBoxContainer/Coords.text = "Coords: " + str(being_slot.grid_coords)
    
    $Panel/ProgressBar.value = being_slot.being_stats.health.get_percent()
    visible = true
    

func on_mouse_exit_being_slot(being_slot: BeingSlot) -> void:
    if !being_slot.being_stats.is_being_slot(): return
    visible = false
