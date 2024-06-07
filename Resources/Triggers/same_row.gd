extends Trigger
class_name SameRow


func is_triggered(current_slot: BeingSlot, other_slot: BeingSlot) -> bool:
    print("Same Row trigger!")
    return current_slot.being_stats.is_same_row(other_slot)
