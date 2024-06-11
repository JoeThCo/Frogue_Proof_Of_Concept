extends Control


var ability_info_ui: PackedScene = preload("res://UI/ability_info_ui.tscn")


func _ready() -> void:
    BattleEventBus.mouse_enter_being_slot.connect(on_mouse_enter_being_slot)
    BattleEventBus.mouse_exit_being_slot.connect(on_mouse_exit_being_slot)
    visible = false


func on_mouse_enter_being_slot(being_slot: BeingSlot) -> void:
    for child: Control in $MainVbox/AbilityUIVbox.get_children():
            child.queue_free()
    
    if !being_slot.being_stats.is_being_slot(): return
    for ability: Ability in being_slot.being_stats.abilities.all_abilities:
        var temp: AbilityInfoUI = ability_info_ui.instantiate() as AbilityInfoUI
        temp.ability_info_init(ability)
        $MainVbox/AbilityUIVbox.add_child(temp)
        
    if len(being_slot.being_stats.abilities.all_abilities) > 0:
        $MainVbox/AbilityLabel.text = "Ability"
    else:
        $MainVbox/AbilityLabel.text = "Abilities"
    
    visible = true
    
    
func on_mouse_exit_being_slot(_being_slot: BeingSlot) -> void:
    visible = false
