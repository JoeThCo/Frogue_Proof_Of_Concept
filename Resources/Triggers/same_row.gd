extends Node
class_name SameRow

func is_triggered(current_slot: BeingSlot, other_slot: BeingSlot) -> bool:
    return current_slot.being_stats.is_same_type(other_slot)

