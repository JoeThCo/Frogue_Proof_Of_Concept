extends Node2D
class_name BeingAbilities


@export var all_abilities: Array[Ability]


func being_abilities_init():
    add_random_ability()


func add_random_ability() -> void:
    var testing: Ability = Ability.new()
    testing.ability_init(BattleResources.get_random_battle_event(), BattleResources.get_random_trigger())
    all_abilities.append(testing)    


func load_battle_event(battle_event: String) -> BattleEvent:
    return load("res://Resources/BattleEvent/" + battle_event + ".gd").new() as BattleEvent
    
    
func load_trigger(trigger: String) -> Trigger:
    return load("res://Resources/Triggers/" + trigger + ".gd").new() as Trigger


func apply_abilitie_grid(current_slot: BeingSlot, grid: BeingGrid, when_to_trigger: BattleResources.WhenToTrigger, what_grid: BattleResources.WhatGrid) -> void:
    for grid_slot: BeingSlot in grid.alive_beings:
        for current_ability: Ability in all_abilities:
            if !current_slot.compare_slots(grid_slot) and current_ability.is_triggered(current_slot, grid_slot, when_to_trigger, what_grid):
                await current_ability.apply_ability(current_slot, grid_slot)
                break
