extends Node2D
class_name Ability


var battle_event: BattleEvent
var trigger: Trigger


func try_apply_ability(current_slot: BeingSlot, other_slot: BeingSlot) -> void:
    if trigger.is_triggered(current_slot, other_slot):
        battle_event.apply_event(current_slot, other_slot)
