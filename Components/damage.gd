extends Node2D
class_name Damage


@export var damage: int


func damage_init(in_amount: int) -> void:
    damage = in_amount


func _to_string() -> String:
    return str(damage)
