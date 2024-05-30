extends Node2D
class_name Damage


@export var amount: int = 1


func damage_init(in_amount: int) -> void:
    amount = in_amount
