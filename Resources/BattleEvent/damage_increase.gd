extends BattleEvent
class_name DamageIncrease


func apply_event(current_slot: BeingSlot, _other_slot: BeingSlot) -> void:
    current_slot.being_stats.damage.amount += 1
    print("Damage Increase!")


func _to_string() -> String:
    return super() + "Damage Increase"
