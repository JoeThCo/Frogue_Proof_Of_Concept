extends BattleEvent
class_name Healing


func apply_event(current_slot: BeingSlot, _other_slot: BeingSlot) -> void:
    print("Healed!")
    current_slot.being_stats.health.heal_damage()


func _to_string() -> String:
    return super() + "Healing"
