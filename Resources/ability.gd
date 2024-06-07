extends Node2D
class_name Ability


var battle_event: BattleEvent
var trigger: Trigger
var when_to_trigger: BattleResources.WhenToTrigger


func ability_init(in_battle_event: BattleEvent, in_trigger: Trigger) -> void:
    battle_event = in_battle_event
    trigger = in_trigger
    when_to_trigger = BattleResources.WhenToTrigger.values()[ randi() % BattleResources.WhenToTrigger.size() ]


func is_triggered(current_slot: BeingSlot, other_slot: BeingSlot, in_when_to_trigger: BattleResources.WhenToTrigger) -> bool:
    return current_slot != other_slot and when_to_trigger == in_when_to_trigger and trigger.is_triggered(current_slot, other_slot)
    

func apply_ability(current_slot: BeingSlot, other_slot: BeingSlot) -> void:
        battle_event.apply_event(current_slot, other_slot)
        current_slot.being_stats.ability_tween(.75)
        await other_slot.being_stats.ability_tween(.75) #this does both at the same time
