extends Resource
class_name Ability


var battle_event: Battle_Event
var trigger: Trigger


#the ability effect
func apply_ability() -> void:
    if trigger.is_triggered():
        battle_event.apply_event()
