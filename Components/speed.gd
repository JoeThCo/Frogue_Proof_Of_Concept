extends Node
class_name Speed


var amount: int


func speed_init():
    amount = (randi() % 10) + 1


func _to_string() -> String:
    return str(amount)
