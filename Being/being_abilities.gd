extends Node2D
class_name Being_Abilities


@export var all_abilities: Array[Ability]


func being_abilities_init():
    var testing: Ability = Ability.new()
    testing.battle_event = load("res://Resources/Battle/BattleEvent/damage_increase.tres")
    testing.trigger = load("res://Resources/Battle/Triggers/same_type_trigger.tres")
    all_abilities.append(testing)


func apply_abilities(current_slot: Being_Slot, other_slot: Being_Slot):
    for current_ability: Ability in all_abilities:
        current_ability.apply_ability(current_slot, other_slot)
