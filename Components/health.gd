extends Node2D
class_name Health

signal health_under_zero


@export var hp: int = 5


func health_init(in_hp: int):
    hp = in_hp


func take_damage(damage: Damage):
    hp -= damage.amount
    
    if hp <= 0:
        health_under_zero.emit()
