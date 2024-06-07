extends Node2D
class_name BeingAbilities


@export var all_abilities: Array[Ability]


func being_abilities_init():
    var testing: Ability = Ability.new()
    testing.battle_event = BattleResources.get_random_battle_event()
    testing.trigger = BattleResources.get_random_trigger()
    all_abilities.append(testing)


func load_battle_event(battle_event: String) -> BattleEvent:
    return load("res://Resources/BattleEvent/" + battle_event + ".gd").new() as BattleEvent
    
    
func load_trigger(trigger: String) -> Trigger:
    print("res://Resources/Triggers/" + trigger + ".gd Being Abil")
    return load("res://Resources/Triggers/" + trigger + ".gd").new() as Trigger


func apply_abilitie_slot(current_slot: BeingSlot, other_slot: BeingSlot) -> void:
    for current_ability: Ability in all_abilities:
         current_ability.try_apply_ability(current_slot, other_slot)
        
        
func apply_abilitie_grid(current_slot: BeingSlot, grid: BeingGrid) -> void:
    for grid_slot: BeingSlot in grid.alive_beings:
         apply_abilitie_slot(current_slot,grid_slot)
