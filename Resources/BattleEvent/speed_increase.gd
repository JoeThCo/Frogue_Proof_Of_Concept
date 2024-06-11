extends BattleEvent
class_name SpeedIncrease


func apply_event(current_slot: BeingSlot, _other_slot: BeingSlot) -> void:
    current_slot.being_stats.speed.amount += 1
    print("Speed Increase!")


func _to_string() -> String:
    return super() + "Speed Increase"
