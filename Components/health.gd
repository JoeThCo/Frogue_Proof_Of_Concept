extends Node2D
class_name Health


signal health_under_zero


var hp: int
var max_hp: int


func health_init() -> void:
    hp = (randi() % 20) + 1
    max_hp = hp
    health_under_zero.connect(on_health_under_zero)


func heal_damage() -> void:
    hp += float(max_hp) * .25
    print(float(max_hp) * .25)
    BattleEventBus.board_update.emit()


func on_health_under_zero() -> void:
    BattleEventBus.board_update.emit()


func is_alive() -> bool:
    return hp > 0
    

func take_damage(damage: Damage) -> void:
    hp -= damage.amount
    if hp <= 0:
        health_under_zero.emit()


func get_percent() -> float:
    return float(hp) / float(max_hp)


func _to_string() -> String:
    return str(hp)
