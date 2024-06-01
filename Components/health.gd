extends Node2D
class_name Health

signal health_under_zero


@export var hp: int


func health_init():
    hp = (randi() % 3) + 1


func take_damage(damage: Damage):
    hp -= damage.amount
    
    if hp <= 0:
        health_under_zero.emit()


func _to_string() -> String:
    return str(hp)
