extends Trigger
class_name SameRow


func is_triggered(current_slot: BeingSlot, other_slot: BeingSlot) -> bool:
    return current_slot.being_stats.is_same_row(other_slot)


func _to_string() -> String:
    return "Same Row as another Being"
