extends Battle_Event
class_name DamageIncrease


var damage_increase_mult: float = 1.5


func apply_event(current_slot: BeingSlot, _other_slot: BeingSlot) -> void:
    current_slot.being_stats.damage.multiply(damage_increase_mult)
    print("Damage Increase!")
