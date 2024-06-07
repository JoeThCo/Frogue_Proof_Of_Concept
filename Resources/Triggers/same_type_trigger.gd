extends Trigger
class_name SameTypeTrigger


func is_triggered(current_slot: Being_Slot, other_slot: Being_Slot) -> bool:
    print(str(current_slot.being_stats.type) + " vs " + str(other_slot.being_stats.type))
    return current_slot.being_stats.is_same_type(other_slot)
