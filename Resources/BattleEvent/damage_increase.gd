extends Battle_Event
class_name DamageIncrease


var damage_increase_mult: float = 1.5


func apply_event(current_slot: Being_Slot, _other_slot: Being_Slot) -> void:
    current_slot.being_stats.damage.multiply(damage_increase_mult)
    print("Damage Increase!")
