extends Node2D
class_name Damage


var damage: int


func damage_init() -> void:
    damage = (randi() % 5) + 1


func _to_string() -> String:
    return str(damage)
