extends Node2D
class_name Damage


var amount: int


func damage_init() -> void:
    amount = (randi() % 5) + 1


func _to_string() -> String:
    return str(amount)
