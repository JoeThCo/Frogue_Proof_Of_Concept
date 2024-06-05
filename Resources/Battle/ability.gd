extends Resource
class_name Ability


var battle_event: Battle_Event
var trigger: Trigger


#the ability effect
func apply_ability(current_slot: Being_Slot, other_slot: Being_Slot) -> void:
    if trigger.is_triggered(current_slot, other_slot):
        print("Ability Triggered!")
        battle_event.apply_event(current_slot, other_slot)
