extends Trigger
class_name SameType


func is_triggered(current_slot: BeingSlot, other_slot: BeingSlot) -> bool:
    return current_slot.being_stats.is_same_type(other_slot)


func _to_string() -> String:
    return "Same Type as another Being"
