extends Node2D
class_name Being_Abilities


@export var all_abilities: Array[Ability]


func being_abilities_init():
    var testing: Ability = Ability.new()
    testing.battle_event = load_battle_event("damage_increase")
    testing.trigger = load_trigger("same_type_trigger")
    all_abilities.append(testing)


func load_battle_event(battle_event: String) -> Battle_Event:
    return load("res://Resources/BattleEvent/" + battle_event + ".gd").new() as Battle_Event
    
    
func load_trigger(trigger: String) -> Trigger:
    return load("res://Resources/Triggers/" + trigger + ".gd").new() as Trigger


func apply_abilities(current_slot: Being_Slot, other_slot: Being_Slot):
    for current_ability: Ability in all_abilities:
        current_ability.apply_ability(current_slot, other_slot)
